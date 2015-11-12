require 'pushpop'
require 'pushpop-slack'

job do
  every 10.seconds
    slack do
      message "Slack Message"
      channel '#general'
    end
end
