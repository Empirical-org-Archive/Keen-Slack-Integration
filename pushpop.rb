require 'pushpop'
require 'pushpop-slack'
require 'pry'

job 'send "Hello, World!" to #general'
  webhook '/hook' do
    binding.pry
    slack do
        message 'Slack Integration!'
    end
  end
end

# job do
#   binding.pry
#   every 1.seconds
#
#   step do
#     puts 'Hello World!'
#   end
#
# end
