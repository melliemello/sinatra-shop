require './main'
require 'sinatra/base'
require 'bundler'
Bundler.require



  

run ArtGarbage::App
# map('/products') { run ArtGarbage::Controllers::ProductController }
# map('/') { run ArtGarbage::Controllers::WebsiteController }

