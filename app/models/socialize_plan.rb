require 'rubygems'
require 'httparty'
require 'json'
class SocializePlan < ActiveRecord::Base
  
  def self.get_access_token
    consumer_key = 'a297dac5-f39e-4f2b-a2d7-c94f6e1f2bcc'
    consumer_secret = '5f72e9cb-33e4-4245-b80e-a0d63905670b'
    
    access_key_token = 'c396b52b-f94b-425f-8338-8072a8bd5f0d'
    access_key_secret = '3c70a37f-969b-4014-ad1b-e30f4bd29ff6'
    base_url = "http://api.getsocialize.com"
    
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret , :site => "http://api.getsocialize.com")
    access_token = OAuth::AccessToken.new(consumer, access_key_token, access_key_secret)
  end
  
  def self.process_activity(entity_identifier)
    context_path = "/v1/comment/?entity_key="
    
    # options = {:query => {:entity_key => activity_identifier, :output => "json"}, headers=>{:oauth_consumer_key=>'',}}
    #     source_events = HTTParty.get(base_url+context_path, options)
    access_token = get_access_token
    
    response = access_token.get(context_path+entity_identifier)
    puts response.body
    json_response = JSON.parse(response.body)
    return if json_response['items'].size == 0
    sorted_response = json_response['items'].sort{|x,y| y['date'].to_date <=> x['date'].to_date}
    item = sorted_response[0]
    i = 0 ; 
    while i<sorted_response.size && !sorted_response[i]['text'].starts_with?('planswithfriends') do
      item = sorted_response[i]
      puts item
      parts = item['text'].split(' ')
      if parts.size == 2 && (parts[0].upcase == 'WEATHER' || parts[0].upcase == 'MOVIES')
        topic = parts[0]
        location = parts[1]
        puts "topic: #{topic}, location: #{location}"
        comment = get_info(topic,location)
        puts "comment: #{comment}"
        access_token.post('/v1/comment/',{ :payload=>"[{\"entity_key\":\""+entity_identifier+"\",\"text\":\""+comment+"\"}]"})
      end
      i = i+1
    end
  end
  
  def self.get_info(topic, loc)
    weather_bug_url = "http://i.wxbug.net/REST/Direct/GetForecast.ashx?zip="+loc+"&nf=3&c=US&l=en&api_key=fxyashp63d8494p288c8na4n"
    rotten_tomatoes_url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=5&country=us&apikey=e73t27rtwd89jjvcpk5h7het"
    if topic.upcase == 'WEATHER'
      json_data = HTTParty.get(weather_bug_url)
      #puts json_data
      comment = "planswithfriends- Day Prediction-"+JSON.parse(json_data.body)['forecastList'][0]['dayPred']+". Night Prediction-"+JSON.parse(json_data.body)['forecastList'][0]['nightPred']
    elsif topic.upcase == 'MOVIES'
      json_data = HTTParty.get(rotten_tomatoes_url)
      comment = "planswithfriends-"+json_data['movies'].collect{|x| x['title']}.join(', ')
    end
  end
  
end
