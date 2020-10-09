require 'httparty'
require 'dotenv/load'
require 'awesome_print'
#require 'table_print'

#verify slack token is working
url = "https://slack.com/api/users.list"
query_paramaters = {
    token: ENV['SLACK_TOKEN']
}
response = HTTParty.get(url, query: query_paramaters)


user_info_array = []
response["members"].each do |member|
  #username
  #realname
  #slack_id
  user_info_hash = {
      username: member["name"],
      real_name: member["real_name"],
      slack_id: member["id"]
  }

  user_info_array << user_info_hash
end

#tp user_info_array

