require 'oj'
require 'active_record'
require 'pg'
require 'logger'
require 'dalli'
require 'rack/cache'
require 'cuba'
require 'warden'
require './db'
require './app'
require './models/postal_code'
require './presenters/postal_codes'
require './authentication/token_strategy.rb'

if ENV['RACK_ENV'] == 'production'
  require 'rack/ssl'
  use Rack::SSL
end

if ENV['VALIDATE_HEADER']
  Warden::Strategies.add(:token, Authentication::TokenStrategy)
  use Warden::Manager do |manager|
    manager.default_strategies :token
    manager.failure_app = lambda{|_e|[401, {"Content-Type" => "application/json"}, [{error: "Not Authorized to use API. Check https://rapidapi.com/acrogenesis/api/mexico-zip-codes"}.to_json]] }
  end
end



run Cuba
