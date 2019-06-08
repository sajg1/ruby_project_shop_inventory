require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/shoe')

also_reload('../models/*')

get '/shoes' do
  @shoes = Shoe.all()
  erb(:"shoes/index")
end

get '/shoes/:id' do
  @shoe = Shoe.find_by_id(params['id'].to_i)
  erb(:"shoes/show")
end
