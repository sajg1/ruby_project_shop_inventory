require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/shoe_controller')
require_relative('controllers/brand_controller')
require_relative('controllers/stock_controller')

also_reload('./models/*')


get '/' do
  @stock_items = StockItem.all()
  erb(:index)
end
