require 'em-http'
require 'json'

module NeighborhoodWatch
  module Agent

    TIMEOUT = 20
    SERVER = "beta.neighborhoodwat.ch"

    def self.run
       EventMachine.run {
         http = get_list

         http.callback {
           process_list(http)
         }

       }
    end

    def self.get_list
     EventMachine::HttpRequest.new("http://#{SERVER}/ping/#{CLIENT_ID}").get :timeout => TIMEOUT
    end

    def self.send_response(response)
      EventMachine::HttpRequest.new("http://#{SERVER}/report/#{CLIENT_ID}").post :timeout => TIMEOUT, :body => {:reports => response}
    end

    def self.process_list(http)
      status = http.response_header.status
      if status == 200
        sites = JSON.parse(http.response)
        done if !sites || sites.size == 0

        multi = EventMachine::MultiRequest.new
        site_requests = []
        sites.each do |site|
          req = EventMachine::HttpRequest.new(site['url']).get(:timeout => TIMEOUT)
          multi.add(req); site_requests << req
        end
        multi.callback  {
          status = {}
          multi.responses[:succeeded].each do |resp|
            site = sites[site_requests.index(resp)]
            if resp.response_header.status == 200
              status[site['id']] = "up"
            else
              status[site['id']] = "error-#{resp.response_header.status}"
            end
          end
          multi.responses[:failed].each do |resp|
            site = sites[site_requests.index(resp)]
            status[site['id']] = "down"
          end

          http = send_response(status)
          http.callback {
            done
          }
        }

      else
        puts "ERROR: #{http.response}" if status == 403
        done
      end
    end

    def self.done
      EventMachine.stop
    end

  end
end
