# What does the NEIGHBORHOODWAT.CH agent do?

Our agent is a little Ruby program that recieves URL-lists, pings them and reports the results to [NEIGHBORHOODWAT.CH](http://neighborhoodwat.ch/). There we list our user's monitored websites statuses and notify them if something goes wrong.

# What do I need to run the agent?

First of all, what you _don't_ need: root privileges. You do need a Unix server running the following software:

1. Ruby
2. Ruby Gems
3. Cron

and

4. a NEIGHBORHOODWAT.CH account

The agent has sofar been tested on Ruby 1.8.6 only but should work on 1.9, too.

# You got me convinced. How do I install the agent?

Installing the agent is easy and takes just about 2 minutes.

_If you're running Ubuntu_, you might have to install Cron. To do this enter the following into your console:

    $ sudo apt-get install cron - on Ubuntu

Start out by installing the NEIGHBORHOODWAT.CH agent gem.

    $ sudo gem install mutle-neighborhoodwatch-agent --source=http://gems.github.com/

Before you continue, make sure you have an ID for your agent. He needs this ID to report to the neighborhood watch. To get an ID sign into your NEIGHBORHOODWAT.CH account. Go to your [dashboard][1], click the button "Add an agent" and name him. Now, click "Add agent" and the new agent will apear in the list above. Right beneath the agent name you'll a link "Instructions". Click it and you'll open a modal containing your agent's ID. Copy it.

Now that you have an agent ID, give it to your agent.

    $ neighborhoodwatch-agent <agent id>

Your agent is now ready to pick up work and is waiting for you to say the word. Tell him how often to check the servers in his list by configuring Cron.

    $ crontab -e

This will open your Crontab in a text editor. Now add the following to the bottom of the file:

    */5 * * * * neighborhoodwatch-agent <agent id>

What this means is that your agent will check on it's neighborhood every 5 Minutes. Replacing the 5 by 20 will result in a 20 minute interval. Many other intervals are possible. To see how to configure Crontab in more detail, please consult a [Crontab reference][2]. We encourage to use an interval of five minutes, though. _If your agent doesn't report in every 60 minutes we consider him as being down._

After a couple of minutes, check your NEIGHBORHOODWAT.CH dashboard again, to see whether your agent has successfully picked up his work.

## Thank you for using and supporting our monitoring network!
  
If you have any other issues, please contact us on Twitter [thehoodwatch](https://twitter.com/thehoodwatch) and we'll get back at you.

[1]: http://neighborhoodwat.ch/dashboard (NEIGHBORHOODWAT.CH dashboard)
[2]: http://www.mostlygeek.com/tech-reference/crontab-reference/ (Mostly Geek: Crontab reference)
