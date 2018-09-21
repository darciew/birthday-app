require 'sinatra/base'

class App < Sinatra::Base
  attr_reader :birthday, :name, :bday

  set :static, true
  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :form
  end

  post '/info' do
    session[:name] = params[:name]
    session[:birthday] = params[:birthday]
    p params
    redirect '/birthday'
  end

  get '/birthday' do
    @name = session[:name]
    @birthday = session[:birthday]
    today = Date.today
    @bday = Date.parse @birthday
      if bday == today
        @bday_str = "Happy birthday #{@name}!"
      elsif bday != today
        days = ((bday - today) % 365).to_i
        @bday_str = "#{days} days until your birthday!"
      end
    erb :birthday
  end

end
