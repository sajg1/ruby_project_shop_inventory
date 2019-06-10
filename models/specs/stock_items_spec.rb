require('minitest/autorun')
require('minitest/rg')

require_relative('../stock_item')


class StockItemTest < MiniTest::Test

  def setup()

    @stock_item1 = StockItem.new({'quantity' => 40})

  end

  def test_shoe_id
    assert_equal(40, @stock_item1.quantity)
  end

end
