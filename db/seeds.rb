require("pry-byebug")
require_relative('../models/brand')
require_relative('../models/shoe')

Brand.delete_all()

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

shoe1.save()
shoe2.save()
shoe3.save()
shoe4.save()

binding.pry

nil
