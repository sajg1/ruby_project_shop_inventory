require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/shoe_controller')
require_relative('controllers/brand_controller')


get '/' do
  erb(:index)
end
