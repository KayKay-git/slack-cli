#!/usr/bin/env ruby
require_relative 'workspace'
require_relative "user"
require_relative "channel"
require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require 'colorize'
require 'table_print'
require 'pry'


def main
  puts "Welcome to the Ada Slack CLI!".yellow
  workspace = Workspace.new

  puts "There are #{workspace.users.length} users and #{workspace.channels.length} channels.\n".magenta

  exit_loop = false
  while(!exit_loop)
    puts "Please select an option from below:".magenta
    puts "1. list users".magenta
    puts "2. list channels".magenta
    puts "3. quit".magenta
    print "Choice: ".yellow

    user_answer = gets.chomp.downcase

    case user_answer
    when "list users", "users"
      tp workspace.users, "slack_id","name", "real_name"
    when "list channels", "channels"
      tp workspace.channels, "name", "slack_id", "topic", "member_count"
    when "quit", "q"
      puts "Thank you for using the Ada Slack. Have a good day!".blue
      exit_loop = true
    else
      puts "Invalid input, try again!\n".red
    end
    puts "What would you like to do next?\n".blue
  end

end

main if __FILE__ == $PROGRAM_NAME