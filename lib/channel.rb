require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require_relative 'recipient'

class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize(name, slack_id, topic, member_count)

    super(name, slack_id)

    @topic = topic
    @member_count = member_count

    #argmuent errors?

  end

  def self.list

    response = self.get("https://slack.com/api/conversations.list")

    user_info_array = []

    response["channels"].each do |channel|
      #sleep(0.5)
      name = channel["name"]
      slack_id = channel["id"]
      topic = channel["purpose"]["value"]
      member_count = channel["num_members"]


      user_info_array << Channel.new(name, slack_id, topic, member_count )
    end

    return user_info_array
  end

  def details
    return {"Name"=> @name, "ID" => @slack_id, "Topic" => @topic, "Member Count" => @member_count}
  end
end