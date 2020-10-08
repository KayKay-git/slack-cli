#!/usr/bin/env ruby
# frozen_string_literal: true
require_relative 'workspace'
require_relative 'user'
require_relative 'channel'
require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require 'colorize'
require 'table_print'
require 'pry'


def main
  puts "Welcome to the Ada Slack CLI!\n".yellow
  workspace = Workspace.new

  puts "There are #{workspace.users.length} users and #{workspace.channels.length} channels.\n".blue

  exit_loop = false
  until(exit_loop)
    puts ''
    puts 'Please select an option from below:'.magenta
    puts '1. list users'.magenta
    puts '2. list channels'.magenta
    puts '3. select user'.magenta
    puts '4. select channel'.magenta
    puts '5. details'.magenta
    puts '6. send message'.magenta
    puts '7. quit'.magenta
    print 'Choice: '.yellow

    user_answer = gets.chomp.downcase

    case user_answer
    when 'list users', 'users', "1"
      tp workspace.users, 'name','slack_id', 'real_name'
    when 'list channels', 'channels', "2"
      tp workspace.channels, 'name', 'slack_id', 'topic', 'member_count'

    when 'select user', "3"
      puts 'Please enter the Username or Slack ID'
      print 'Select User:'.yellow
      username_or_id = gets.chomp.downcase
      workspace.select_user(username_or_id)
      puts "Selected User: #{workspace.selected.name}".blue

    when 'select channel', "4"
      puts 'Please enter the Name or Slack ID'
      print 'Select Channel:'.yellow
      name_or_id = gets.chomp.downcase
      workspace.select_channel(name_or_id)
      puts "Selected Channel: #{workspace.selected.name}".blue
    when 'details', 'detail', "5"
      puts "Here are the details..."
      puts workspace.details

    when 'send message', 'message', "6"
      #puts "What is the Name of Slack ID of the person you would like to message?"
      #message_to = gets.chomp
      #puts "What is the message you would like to send?"
      #
      workspace.send_message

    when 'quit', 'q', "7"
      puts 'Thank you for using the Ada Slack. Have a good day!'.blue
      exit_loop = true
    else
      puts "Invalid input, try again!\n".red
    end
    # puts "What would you like to do next?\n".blue
  end
end

#pp String.colors
main if __FILE__ == $PROGRAM_NAME