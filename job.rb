require 'pushpop'
require 'pushpop-slack'
require 'pushpop-keen'
require 'pry'



job 'send keen stats to Quill Slack' do

  every 24.hours

  stats = ["Student created an account", "Teacher created an account", "Student signed in", "Teacher signed in", "Student completed an activity"]
  stats.each do |stat|
    keen stat do
      event_collection  stat
      analysis_type     'count'
      timeframe         'last_24_hours'
    end
  end

  slack do |response, step_responses|
    message "In the last 24 hours: \n
             #{step_responses["Student created an account"]} students created accounts
             #{step_responses["Teacher created an account"]} teachers created accounts
             #{step_responses["Teacher signed in"]} teachers signed in
             #{step_responses["Student signed in"]} students signed in
             #{step_responses["Student completed an activity"]} students completed activities"
    channel '#general'
  end
end
