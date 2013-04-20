require 'will_paginate'
require 'rsolr'
require 'geocoder'

class CSPC < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/map' do
    @locations = Geocoder.search(params[:location])
    erb :map
  end

  get '/about' do
    @page_title = "About the Project"
    erb :about
  end

  get '/results/?' do
    @page_title = "Search Results"
    rsolr = RSolr.connect :url => 'http://50.112.232.31:8080/solr/'

    @results = rsolr.paginate 1, 10, "select", :params => {:q => '*:*' }

    erb :results
  end
end
