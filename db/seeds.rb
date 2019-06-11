require("pry-byebug")
require_relative('../models/brand')
require_relative('../models/shoe')
require_relative('../models/stock_item')


Brand.delete_all()
Shoe.delete_all()
StockItem.delete_all()

brand1 = Brand.new({
  "name" => "Nike"
  })

brand2 = Brand.new({
  "name" => "Adidas"
  })

brand3 = Brand.new({
  "name" => "Timberland"
  })

brand1.save()
brand2.save()
brand3.save()

shoe1 = Shoe.new({
  'name' => 'Air Zoom Pegasus 36',
  'type' => 'Running',
  'purchase_price' => 55,
  'selling_price' => 69,
  'brand_id' => brand1.id
  })

shoe2 = Shoe.new({
  'name' => 'Kobe IV Protro',
  'type' => 'Basketball',
  'purchase_price' => 70,
  'selling_price' => 89,
  'brand_id' => brand1.id
  })

shoe3 = Shoe.new({
  'name' => 'Killington Low Chukka',
  'type' => 'Boot',
  'purchase_price' => 58,
  'selling_price' => 66,
  'brand_id' => brand3.id
  })

shoe1.save()
shoe2.save()
shoe3.save()


stock_item1 = StockItem.new({ 'quantity' => 0, 'shoe_id' => shoe1.id})
stock_item2 = StockItem.new({ 'quantity' => 4, 'shoe_id' => shoe2.id})
stock_item3 = StockItem.new({ 'quantity' => 60, 'shoe_id' => shoe3.id})

stock_item1.save()
stock_item2.save()
stock_item3.save()
