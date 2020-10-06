require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require_relative 'recipient'

class User < Recipient

  attr_reader :real_name

  def initialize(name, slack_id, real_name)

    super(name, slack_id)

    @real_name = real_name

    #argmuent errors?

  end

  def self.list 

  end
end