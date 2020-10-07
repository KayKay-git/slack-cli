require 'httparty'
require 'dotenv/load'
require 'awesome_print'

#verify slack token is working
url = "https://slack.com/api/users.list"
query_paramaters = {
    token: ENV['SLACK_TOKEN']
}
response = HTTParty.get(url, query: query_paramaters)

#pp response["members"]
# real_names = []
#
# response["members"].each do |member|
#   #username
#   # realname
#   # slackid
#   real_names << member["real_name"]
# end
#
# pp real_names

real_names = []

response["members"].each do |member|
  #username
  # realname
  # slackid
  user_info= {
      "username" => member["name"],
      "real_name" => member["real_name"],
      "slack_id" => member["id"]
  }

  real_names << user_info
end

puts real_names






