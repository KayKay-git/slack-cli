require_relative 'user'
require_relative 'channel'
require_relative 'recipient'
require 'httparty'
require 'dotenv/load'



class Workspace
  attr_reader :users, :channels

  def initialize
    @users = User.list
    @channels = Channel.list
  end

  #also methods to send http request, lists, sending messsages, getting details ?

end