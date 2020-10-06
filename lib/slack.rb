#!/usr/bin/env ruby
require_relative 'workspace.rb'
require 'httparty'
require 'dotenv/load'
require 'awesome_print'

def main
  puts "Welcome to the Ada Slack CLI!"
  workspace = Workspace.new

  # TODO project
  #
  # case or if/else statement ?

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME