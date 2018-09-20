require 'sinatra/base'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :form
  end

  post '/info' do
    session[:name] = params[:name]
    session[:birthday] = params[:birthday]
    p params
    redirect '/its-your-birthday'
  end

  get '/its-your-birthday' do
    @name = session[:name]
    @birthday = session[:birthday]
    today = Date.today
    date = Date.parse @birthday
      if date == today
        @bday_str = "Happy birthday #{@name}!"
      elsif date != today
        days = ((date - today) % 365).to_i
        @bday_str = "#{days} days until your birthday!"
      end
    erb :birthday
  end

end
