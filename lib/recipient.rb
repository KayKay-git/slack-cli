require 'httparty'
require 'dotenv/load'
require 'awesome_print'

class Recipient
  attr_reader :name, :slack_id

  def initialize(name, slack_id)

    @name = name
    @slack_id = slack_id

  end

  def self.get(url)
    query_paramaters = {
        token: ENV['SLACK_TOKEN']
    }
    response = HTTParty.get(url, query: query_paramaters)

  end

end