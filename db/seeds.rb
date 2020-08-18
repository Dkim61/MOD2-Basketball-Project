Player.destroy_all

require 'uri'
require 'net/http'
require 'openssl'
my_url = "https://api-nba-v1.p.rapidapi.com/players/league/standard"
# my_url = my_url + ""
url = URI(my_url)

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
request["x-rapidapi-key"] = ENV["NBA_API_KEY"]

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
# request["x-rapidapi-key"] = ENV["NBA_API_KEY"]

require 'json'

response = http.request(request)
myjson = JSON.parse(response.body)
# puts response.read_body
myjson["api"]["players"].each do |player|
    puts player["firstName"] + " " + player["lastName"] + " " + player['playerId']
    my_url = "https://api-nba-v1.p.rapidapi.com/statistics/players/playerId/"
    my_url = my_url + player['playerId']
    url = URI(my_url)

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'api-nba-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV["NBA_API_KEY"]
    response = http.request(request)
    myjson = JSON.parse(response.body)
    # puts myjson["api"]["statistics"]
    my_params = {"firstName"=>player["firstName"], "lastName"=>player["lastName"], "playerId"=>player["playerId"]}
    Player.create(my_params)
  
end

# puts myjson[:api][:players]