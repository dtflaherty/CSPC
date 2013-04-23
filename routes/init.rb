require 'rsolr'
require 'rsolr-ext'
require 'geocoder'
require 'will_paginate'
require 'pp'

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

  get '/results/?' do
    @page_title = "Search Results"
    #rsolr = RSolr::Ext.connect :url => 'http://50.112.232.31:8080/solr/'
    rsolr = RSolr.connect :url => 'http://50.112.232.31:8080/solr/'

    rsolr_params = {
      :q => '*:*',
    }

    pp rsolr

    #@results = rsolr. params[:page], 10, "select", :params => { :q => '*:*' }
    #@results = rsolr.find solr_params, :method => :post
   
    @results = rsolr.paginate params[:page], 10, 'select', :params => {:q => '*:*'}
    erb :results
  end
end
