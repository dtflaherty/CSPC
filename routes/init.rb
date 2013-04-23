require 'rsolr'
require 'geocoder'
require 'will_paginate'

class CSPC < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/map' do
    @locations = Geocoder.search(params[:location])
    erb :map
  end

  get '/about/?' do
    @page_title = "About the Project"
    erb :about
  end

    get '/source/?' do
    @page_title = "Source"
    erb :source
  end

  get '/results/?' do
    @page_title = "Search Results"
    rsolr = RSolr.connect :url => 'http://50.112.232.31:8080/solr/'

    solr_params = {
      :q => "*:*"
    }

    @results = rsolr.paginate params[:page], 10, 'select', :params => solr_params
    erb :results
  end
end
