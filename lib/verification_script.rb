require 'httparty'
require 'dotenv/load'
require 'awesome_print'

#verify slack token is working
url = "https://slack.com/api/conversations.list"

query_paramaters = {
    token: ENV['SLACK_TOKEN']
}

response = HTTParty.get(url, query: query_paramaters)
pp response

# pp response["name"]
#




