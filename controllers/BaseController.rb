require './helpers/ApplicationHelpers'

class BaseController < Sinatra::Base
  helpers Sinatra::ApplicationHelpers
  register Sinatra::ActiveRecordExtension
end