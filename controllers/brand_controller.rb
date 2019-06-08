require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/brand')

also_reload('../models/*')

get '/brands' do
  @brands = Brand.all()
  erb(:"brands/index")
end

post '/brands' do
  @brand = Brand.new(params)
  @brand.save()
  redirect('/brands')
end

get '/brands/new' do
  erb(:"brands/new")
end
