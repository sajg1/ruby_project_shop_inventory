require('minitest/autorun')
require('minitest/rg')

require_relative('../shoe')

class ShoeTest < Minitest::Test

  def setup
#should I have brand_id and stockitem_id in here?
    @shoe1 = Shoe.new({
      'name' => 'Air Zoom Pegasus 36',
      'type' => 'Running',
      'purchase_price' => 25,
      'selling_price' => 50
      })

  end

  def test_name
    assert_equal("Air Zoom Pegasus 36", @shoe1.name)
  end

  def test_type
    assert_equal("Running", @shoe1.type)
  end

  def test_purchase_price
    assert_equal(25, @shoe1.purchase_price)
  end

  def test_selling_price
    assert_equal(50, @shoe1.selling_price)
  end

  def test_markup
    assert_equal("£25 (100%)", @shoe1.markup)
  end


end
