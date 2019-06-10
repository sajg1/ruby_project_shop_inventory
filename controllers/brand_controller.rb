require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/brand')
require_relative('../models/shoe')

also_reload('../models/*')

#INDEX

get '/brands' do
  @brands = Brand.all()
  erb(:"brands/index")
end

#CREATE

post '/brands' do
  @brand = Brand.new(params)
  @brand.save()
  redirect('/brands')
end

#NEW
get '/brands/new' do
  erb(:"brands/new")
end

#DELETE

post '/brands/:id/delete' do
  @brand = Brand.find_by_id(params['id'].to_i)
  @brand.delete
  redirect('/brands')
end

#SHOW

get '/brands/:id' do
  @brand = Brand.find_by_id(params['id'].to_i)
  @shoes = Shoe.all()
  erb(:"brands/show")
end
