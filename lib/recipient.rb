require 'httparty'
require 'dotenv/load'
require 'awesome_print'

class Recipient
  attr_reader :name, :slack_id

  def initialize(name, slack_id)

    @name = name
    @slack_id = slack_id

  end

  #also methods to send http request, lists, sending messsages, getting details ?

  # private
  #
  # def self.get(url, query_paramaters)
  #   url = url
  #   query_paramaters = {
  #       token: ENV['SLACK_TOKEN']
  #   }
  #   return HTTParty.get(url, query: query_paramaters)
  #
  # end



#   def self.list
#
#   end
#
end