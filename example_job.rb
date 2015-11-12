require 'pushpop'
require 'pushpop-slack'


job do
  slack do
    message "fuck webhooks"
    channel '#general'
  end
end
