require 'geocoder'

class Locator < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/map' do
    @locations = Geocoder.search(params[:location])
    erb :map
  end
end
