require_relative('../models/stock_item')
require_relative('../models/shoe')


post '/stock_items/:id/buy' do
  stock_item = StockItem.find_by_id(params['id'].to_i)
  stock_item.add_stock(params['amount'].to_i  )
  redirect to '/'
end

post '/stock_items/:id/sell' do
  stock_item = StockItem.find_by_id(params['id'].to_i)
  stock_item.sell_stock(params['amount'].to_i)
  redirect to '/'
end

#new
get '/stock_items/new' do
  @shoes = Shoe.all()
  erb(:"stock/new")
end

#create
post '/stock_items' do
  stock_item = StockItem.new(params)
  stock_item.save()
  redirect to '/'
end
