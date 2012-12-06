class Locator < Sinatra::Base
  get '/' do
    erb :index
  end
end
