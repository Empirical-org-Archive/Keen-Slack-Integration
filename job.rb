require 'pushpop'
require 'pushpop-slack'
require 'pushpop-keen'

job 'send keen stats to Quill Slack' do
  every 10.seconds
    keen do
      event_collection  'accounts'
      analysis_type     'count'
      timeframe         'last_month'
    end

    slack do |response|
      message "#{response} students signed in in the last month"
      channel '#general'
    end
end
