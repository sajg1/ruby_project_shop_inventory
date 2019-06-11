require_relative('../models/shoe')
require_relative('../models/brand')

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

#EDIT

get '/brands/:id/edit' do
  @brand = Brand.find_by_id(params['id'].to_i)
  erb(:"brands/edit")
end

#UPDATE

post '/brands/:id' do
  brand = Brand.new(params)
  brand.update()
  redirect to "/brands/#{params['id']}"
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
