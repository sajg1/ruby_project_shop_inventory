


post '/stock_items/:id/buy' do
  stock_item = StockItem.find_by_id(params['id'].to_i)
  stock_item.add_stock(params['amount'].to_i  )
  redirect to '/'
  # find the stock item to update
  # get the amount from the form (params) by which we want to update
  # call a method on the stock item (e.g. stock_item.add_stock(amount) )
  # redirect back to all stock items
end
post '/stock_items/:id/sell' do
  stock_item = StockItem.find_by_id(params['id'].to_i)
  stock_item.sell_stock(params['amount'].to_i)
  redirect to '/'
  # find the stock item to update
  # get the amount from the form (params) by which we want to update
  # call a method on the stock item (e.g. stock_item.add_stock(amount) )
  # redirect back to all stock items
end

# get '/stock' do
#   erb(:index)
# end

# get '/stock/:id' do
#   @stock_item = StockItem.find_by_id(params['id'].to_i)
#   erb(:"stock/show")
# end
#
# post '/stock/:id/stock_added' do
#   stock_item = StockItem.find_by_id(params['id'].to_i)
#   stock_item.update()
#   erb(:"stock/stock_added")
# end
