require 'httparty'
require 'dotenv/load'
require 'awesome_print'

class Recipient
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id

  end

  #also methods to send http request, lists, sending messsages, getting details ?


end