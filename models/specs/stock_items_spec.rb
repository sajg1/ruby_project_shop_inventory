require('minitest/autorun')
require('minitest/rg')

require_relative('../stock_item')
require_relative('../shoe')


class StockItemTest < MiniTest::Test

  def setup()

    @brand1 = Brand.new({'name' => 'Nike'})

    @shoe1 = Shoe.new({
      'name' => 'Air Zoom Pegasus 36',
      'type' => 'Running',
      'purchase_price' => 25,
      'selling_price' => 69,
      'brand_id' => @brand1.id
      })

    @stock_item1 = StockItem.new({'quantity' => 40, 'shoe_id' => @shoe1.id})

  end

  def test_shoe_quantity
    assert_equal(40, @stock_item1.quantity)
  end

  # def test_shoe
  #   assert_equal(, @stock_item1.shoe)
  # end

  def test_add_stock
      @stock_item1.add_stock(5)
    assert_equal(45, @stock_item1.quantity)
  end

  def test_add_negative_stock
      @stock_item1.add_stock(-5)
    assert_equal(40, @stock_item1.quantity)
  end

  def test_sell_stock
    @stock_item1.sell_stock(5)
    assert_equal(35, @stock_item1.quantity)
  end

end
