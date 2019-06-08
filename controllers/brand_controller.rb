require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/brand')

also_reload('../models/*')

get '/brands' do
  @brands = Brand.all()
  erb(:"brands/index")
end

get '/brands/new' do
  erb(:"brands/new")
end
