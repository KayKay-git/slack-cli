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

    response = User.get("https://slack.com/api/users.list")

    user_info_array = []

    response["members"].each do |member|
      username = member["name"]
      real_name = member["real_name"]
      slack_id = member["id"]

      user_info_array << User.new(username, slack_id, real_name )
    end

    return user_info_array
  end

  def details
    #is it better to format as string?
    #return "ID: #{@slack_id}, Name: #{@name}, Real Name: #{@real_name}"
    return {"ID"=> @slack_id, "Name" => @name, "Real Name" => @real_name}
  end

end
#
#  lisa = User.new("sfhjdhf", "31212", "lisa matt")
# puts lisa.details

#ap User.list