require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/shoe')

also_reload('../models/*')

get '/shoes' do
  @shoes = Shoe.all()
  erb(:"shoes/index")
end
