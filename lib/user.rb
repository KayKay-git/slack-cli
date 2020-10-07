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

  def list_users
    #verify slack token is working
    url = "https://slack.com/api/users.list"
    query_paramaters = {
        token: ENV['SLACK_TOKEN']
    }
    response = HTTParty.get(url, query: query_paramaters)

    real_names = []

    response["members"].each do |member|
      user_info= {
          "username" => member["name"],
          "real_name" => member["real_name"],
          "slack_id" => member["id"]
      }

      real_names << User.new(user_info)
    end

    return real_names

    end

end


