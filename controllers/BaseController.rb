require 'sinatra/base'

class BaseController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
end