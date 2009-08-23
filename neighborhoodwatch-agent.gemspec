# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |s|
  s.name = %q{neighborhoodwatch-agent}
  s.version = "0.0.4"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mutwin Kraus"]
  s.date = %q{2009-08-23}
  s.email = %q{mutle@redcursor.de}
  s.executables = ["neighborhoodwatch-agent"]
  s.extra_rdoc_files = []
  s.files = [
     ".gitignore",
     "README.markdown",
     "bin/neighborhoodwatch-agent",
     "lib/neighborhoodwatch-agent.rb",
     "neighborhoodwatch-agent.gemspec"
  ]
  s.homepage = %q{http://neighborhoodwat.ch/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Client for the the neighborhoodwat.ch web service}
  s.test_files = []
  s.add_dependency("eventmachine")
  s.add_dependency("json")
  s.add_dependency("igrigorik-em-http-request")
 
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
 
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

