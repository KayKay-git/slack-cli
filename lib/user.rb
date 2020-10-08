require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require 'table_print'
require_relative 'recipient'


class User < Recipient
  attr_reader :real_name

  def initialize(name, slack_id, real_name)
    super(name, slack_id)
    @real_name = real_name
  end


  def self.list

    response = self.get("https://slack.com/api/users.list")

    user_info_array = []

    response["members"].each do |member|
      #sleep(0.5)
      username = member["name"]
      real_name = member["real_name"]
      slack_id = member["id"]

      user_info_array << User.new(username, slack_id, real_name )
    end

    return  user_info_array
  end

  def user_details
      #sleep(0.5)
      # puts "Name: #{member["name"]}"
      # puts "Real name: #{member["real_name"]}"
      # puts "ID: #{ member["id"]}"

      return {"ID"=> @slack_id, "Name" => @name, "Real Name" => @real_name}

    end
end
#
# lisa = User.new("sfhjdhf", "31212", "lisa matt")
# pp lisa.user_details

ap User.list