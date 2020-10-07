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

    case user_answer
    when "list users"
      pp #call the method
    when "list channels"
      #pp #call method
    when "quit"
      exit
    end

  puts "Thank you for using the Ada Slack"

end

main if __FILE__ == $PROGRAM_NAME