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
  'stock_quantity' => 20,
  'stock_cost' => 25,
  'selling_price' => 69,
  'brand_id' => brand1.id
  })

shoe2 = Shoe.new({
  'name' => 'Kobe IV Protro',
  'type' => 'Basketball',
  'stock_quantity' => 5,
  'stock_cost' => 30,
  'selling_price' => 89,
  'brand_id' => brand1.id
  })

shoe3 = Shoe.new({
  'name' => 'Killington Low Chukka',
  'type' => 'Boot',
  'stock_quantity' => 10,
  'stock_cost' => 40,
  'selling_price' => 66,
  'brand_id' => brand3.id
  })

shoe4 = Shoe.new({
  'name' => 'Predator 18',
  'type' => 'Football Boot',
  'stock_quantity' => 20,
  'stock_cost' => 20,
  'selling_price' => 59,
  'brand_id' => brand2.id
  })

shoe5 = Shoe.new({
  'name' => 'Premium 6 inch Boot',
  'type' => 'Boot',
  'stock_quantity' => 15,
  'stock_cost' => 30,
  'selling_price' => 100,
  'brand_id' => brand3.id
  })

shoe6 = Shoe.new({
  'name' => 'SB Dunk Low Pro',
  'type' => 'Skateboarding',
  'stock_quantity' => 25,
  'stock_cost' => 15,
  'selling_price' => 75,
  'brand_id' => brand1.id
  })

shoe7 = Shoe.new({
  'name' => 'Power Perfect 3',
  'type' => 'Weightlifting',
  'stock_quantity' => 5,
  'stock_cost' => 30,
  'selling_price' => 110,
  'brand_id' => brand2.id
  })

shoe8 = Shoe.new({
  'name' => 'FI Impact 3',
  'type' => 'Golf',
  'stock_quantity' => 2,
  'stock_cost' => 35,
  'selling_price' => 95,
  'brand_id' => brand1.id
  })

shoe1.save()
shoe2.save()
shoe3.save()
shoe4.save()
shoe5.save()
shoe6.save()
shoe7.save()
shoe8.save()

stock_item1 = StockItem.new({ 'quantity' => 40, 'shoe_id' => shoe1.id})
stock_item2 = StockItem.new({ 'quantity' => 50, 'shoe_id' => shoe2.id})
stock_item3 = StockItem.new({ 'quantity' => 60, 'shoe_id' => shoe3.id})

stock_item1.save()
stock_item2.save()
stock_item3.save()

binding.pry

nil
