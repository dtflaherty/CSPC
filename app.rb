require "sinatra"
require "sinatra/content_for"
require 'will_paginate'
require 'rsolr'
require 'geocoder'



require_relative 'routes/init'

class CSPC < Sinatra::Base
  enable :sessions

  configure do
    set :app_file, __FILE__
  end

  configure :development do
    enable :logging, :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end
end
