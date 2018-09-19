require 'sinatra/base'

class App < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    erb :form
  end

  post '/its-your-birthday' do

    @name = params[:name]
    @birthday = params[:birthday]
    p params
    erb :birthday
  end

end
