require('minitest/autorun')
require('minitest/rg')

require_relative('../brand')

class BrandTest < Minitest::Test

  def setup

    @brand1 = Brand.new({
      'name' => 'Nike'
      })

  end

  def test_name
    assert_equal('Nike', @brand1.name)
  end

  

end
