require 'sinatra'
require 'pushpop'
require 'pushpop-slack'
require 'pry'

get "/trigger" do
  job do
    slack do |details|
        message "do i work as a webhook?"
    end
  end
end
