require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/shoe')
require_relative('../models/brand')

also_reload('../models/*')

#INDEX

get '/shoes' do
  @shoes = Shoe.all()
  erb(:"shoes/index")
end

#NEW

get '/shoes/new' do
  @brands = Brand.all()
  erb(:"shoes/new")
end

#SHOW

get '/shoes/:id' do
  @shoe = Shoe.find_by_id(params['id'].to_i)
  erb(:"shoes/show")
end

#DELETE

post '/shoes/:id/delete' do
  @shoe = Shoe.find_by_id(params['id'].to_i)
  @shoe.delete()
  redirect('/shoes')
end
