require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/shoe_controller')


get '/' do
  erb(:index)
end
