#!/usr/bin/env ruby
require_relative 'workspace.rb'
require 'httparty'
require 'dotenv/load'
require 'awesome_print'
require 'table_print'

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  puts "\nWhat would you like to do?"
  puts "\nYour options are:"
  puts "1. list users"
  puts "2. list channels"
  puts "3. quit"
  print "\nChoice:"
  user_answer = gets.chomp.downcase

  #while user_answer != "quit"
    case user_answer
    when "list users"
      pp #create method for list_users
    when "list channels"
      pp #create method for list_channels
    when "quit"
      exit
    end
  #   exit
  # end
  puts "Thank you for using the Ada Slack"

  # case or if/else statement ?"

end

main if __FILE__ == $PROGRAM_NAME