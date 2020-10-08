require_relative 'user'
require_relative 'channel'
require_relative 'recipient'
require 'httparty'
require 'dotenv/load'


class Workspace
  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list
    @channels = Channel.list
    @selected = nil
  end

  #also methods to send http request, lists, sending messsages, getting details ?

  def select_user(user_name_or_id)
    @selected = @users.find do |user|
      valid_users = [user.name, user.slack_id, user.real_name]
      valid_users.include?(user_name_or_id)
    end

    if @selected == nil
      raise ArgumentError, "The user could not be found."
    end
  end

  def select_channel(name_or_id)
    @selected = @channels.find { |channel| [channel.name, channel.slack_id].include?(name_or_id) }

    if @selected == nil
      raise ArgumentError, "That channel could not be found."
    end
  end

  def details
    if @selected != nil
      return @selected.details
    else
      raise ArgumentError, "Please choose a user or channel"
    end
  end

  def send_message
    if @selected != nil
      puts "Please type in the message you would like to send"
      message = gets.chomp

    end
    raise ArgumentError, "Please choose a user or channel"
  end
end


#tp User.list, "name","slack_id", "real_name"
  #ap User.list