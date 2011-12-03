require 'rubygems'
require 'httparty'
class SocializePlan < ActiveRecord::Base
  
  def process_activity(activity_identifier)
    consumer_key = 'a297dac5-f39e-4f2b-a2d7-c94f6e1f2bcc'
    consumer_secret = '5f72e9cb-33e4-4245-b80e-a0d63905670b'
    
    access_key_token = 'c396b52b-f94b-425f-8338-8072a8bd5f0d'
    access_key_secret = '3c70a37f-969b-4014-ad1b-e30f4bd29ff6'
    base_url = "http://api.getsocialize.com"
    #"oauth_consumer_key": <str>
    #"oauth_nonce": <str>, 
    #"oauth_signature": <str>, 
    #"oauth_signature_method": "HMAC-SHA1",
    #"oauth_timestamp": <int>, 
    #"oauth_token": <str>,
    #"oauth_version": "1.0"
    context_path = "/v1/comment/?entity_key="
    
    # options = {:query => {:entity_key => activity_identifier, :output => "json"}, headers=>{:oauth_consumer_key=>'',}}
    #     source_events = HTTParty.get(base_url+context_path, options)
    
    consumer = OAuth::Consumer.new(consumer_key, consumer_secret , :site => "http://api.getsocialize.com")
    access_token = OAuth::AccessToken.new(consumer, access_key_token, access_key_secret)
    
    
  end
  
end
