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

  def self.list

  end


end