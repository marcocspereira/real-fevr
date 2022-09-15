require 'httparty'
require 'json'

return if Player.any?

puts('Start of players seed task')
begin
  puts('Trying to get data from RealFevr')
  json_data = HTTParty.get('https://raw.githubusercontent.com/RealFevr/challenge/master/data/players.json')
  puts('Data downloaded')
rescue HTTParty::Error
  puts(' HTTParty::Error. Now using players.json offline file...')
  json_data = File.read('./players.json')
  puts('Data loaded')
end

puts('Parse and persist data')
data_hash = JSON.parse(json_data)
players = data_hash.dig('data','teams').map{ |team| team['players'] }.flatten
players.map{ |player| player['number'] = nil if player['number'] == 'nil' }
Player.create!(players)
puts('End of players seed task')