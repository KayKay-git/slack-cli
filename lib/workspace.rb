require_relative 'user'
require_relative 'channel'
require_relative 'recipient'
require 'httparty'
require 'dotenv/load'
require 'colorize'

class Workspace
  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list
    @channels = Channel.list
    @selected = nil
  end

  #also methods to send http request, lists, sending messsages, getting details ?

  def select_user(user_name_or_id)
    user_name_or_id = user_name_or_id.downcase
    @selected = @users.find do |user|
      valid_users = [user.name.downcase, user.slack_id.downcase, user.real_name.downcase]
      valid_users.include?(user_name_or_id)
    end

    if @selected == nil
      #raise ArgumentError, "The user could not be found."
      puts "The user could not be found."
      return
    end
  end

  def select_channel(name_or_id)
    name_or_id = name_or_id.downcase
    @selected = @channels.find { |channel| [channel.name.downcase, channel.slack_id.downcase].include?(name_or_id) }

    if @selected == nil
      raise ArgumentError, "That channel could not be found."
    end
  end

  def details
    if @selected != nil
      return @selected.details
    else
      puts "Please choose a user or channel"
      return
    end
  end

  def send_message
    message = ''
    if @selected != nil
      until !message.empty?
        puts "Please type in the message you would like to send.".light_blue
        print "Message:".yellow
        message = gets.chomp
      end
    else
      puts "Please select a user or a channel"
      return
    end

      url = "https://slack.com/api/chat.postMessage"
      params = {
          token: ENV['SLACK_TOKEN'],
          channel: @selected.slack_id,
          text: message
      }

    response = HTTParty.post(url, body: params)
    #puts response

    
    if response["ok"] != true
      raise StandardError, "Error #{response.code}: #{response.message}"
    else
      puts "Your message \"#{message}\" was successfully sent to #{@selected.slack_id}!".light_magenta
    end
  end
end
