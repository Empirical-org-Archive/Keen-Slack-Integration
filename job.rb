require 'pushpop'
require 'pushpop-slack'
require 'pushpop-keen'
require 'pry'



job 'send keen stats to Quill Slack' do

  every 24.hours

  stats_count = ["Student created an account", "Teacher created an account", "Teacher signed in", "Student completed an activity"]
  stats_count.each do |stat|
    keen stat do
      event_collection  stat
      analysis_type     'count'
      timeframe         'last_24_hours'
    end
  end
  #
  stats_unique = ["Teacher signed in", "Student signed in"]
  stats_unique.each do |stat|
    keen stat do
      event_collection  stat
      analysis_type     'count_unique'
      timeframe         'last_24_hours'
      target_property   'userId'
    end
  end

  slack do |response, step_responses|
    message "In the last 24 hours: \n
             #{step_responses["Student created an account"]} students created accounts
             #{step_responses["Teacher created an account"]} teachers created accounts
             #{step_responses["Student completed an activity"]} activities completed
             #{step_responses["Teacher signed in"]} teachers signed in
             #{step_responses["Student signed in"]} students signed in"

    channel '#general'
  end
end
