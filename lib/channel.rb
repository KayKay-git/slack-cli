require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require_relative 'recipient'

class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize(name, id, topic, member_count)
    super(name, id)

    @topic = topic
    @member_count = member_count

    #argmuent errors?

  end

end