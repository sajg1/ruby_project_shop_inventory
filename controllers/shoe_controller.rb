require_relative('../models/brand')
require_relative('../models/shoe')
require_relative('../models/stock_item')

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


#CREATE

post '/shoes' do
  @shoe = Shoe.new(params)
  @shoe.save()
  redirect('/shoes')
end

# EDIT

get '/shoes/:id/edit' do
  @shoe = Shoe.find_by_id(params['id'].to_i)
  @brands = Brand.all()
  erb(:"shoes/edit")
end

# UPDATE

post '/shoes/:id' do
  shoe = Shoe.new(params)
  shoe.update()
  redirect to "/shoes/#{params['id']}"
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
