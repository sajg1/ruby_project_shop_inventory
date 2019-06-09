require('minitest/autorun')
require('minitest/rg')

require_relative('../shoe')

class ShoeTest < Minitest::Test

  def setup

    @shoe1 = Shoe.new({
      'name' => 'Air Zoom Pegasus 36',
      'type' => 'Running',
      'stock_quantity' => 0,
      'stock_cost' => 25,
      'selling_price' => 69
      })

  end

  def test_name
    assert_equal("Air Zoom Pegasus 36", @shoe1.name)
  end

  def test_type
    assert_equal("Running", @shoe1.type)
  end

  def test_stock_quantity
    assert_equal(0, @shoe1.stock_quantity)
  end

  def test_stock_cost
    assert_equal(25, @shoe1.stock_cost)
  end

  def test_selling_price
    assert_equal(69, @shoe1.selling_price)
  end

  def test_add_stock
    @shoe1.add_stock(5)
    assert_equal(5, @shoe1.stock_quantity)
  end

  def test_stock_level
    assert_equal("Out of Stock", @shoe1.stock_level)
  end


end
