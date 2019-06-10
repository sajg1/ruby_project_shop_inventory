require_relative("../db/sql_runner")
require_relative("./brand")

class Shoe

  attr_reader :id, :brand_id, :name, :type, :purchase_price
  attr_accessor :stock_quantity, :selling_price

  def initialize(options)

    @name = options['name']
    @type = options['type']
    @stock_quantity = options['stock_quantity'].to_i
    @purchase_price = options['purchase_price'].to_i
    @selling_price = options['selling_price'].to_i
    @brand_id = options['brand_id'].to_i
    @id = options['id'] if options['id'].to_i

  end

# CREATE

  def save()
    sql = "INSERT INTO shoes
    (
      name, type, stock_quantity, purchase_price, selling_price, brand_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    ) RETURNING * "
    values = [@name, @type, @stock_quantity, @purchase_price, @selling_price, @brand_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

#UPDATE

  def update()
    sql = "UPDATE shoes SET
    (
      name, type, stock_quantity, purchase_price, selling_price, brand_id
    )
    =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @stock_quantity, @purchase_price, @selling_price, @brand_id, @id]
    SqlRunner.run(sql, values)
  end

# DELETE

  def delete()
    sql = "DELETE FROM shoes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def brand()
    sql = "SELECT * FROM brands WHERE id = $1"
    values = [@brand_id]
    product_brand = SqlRunner.run(sql, values).first
    return Brand.new(product_brand).name
  end

#ask about how to incorporate this
  def add_stock(num)
    @stock_quantity += num
    update()
  end

  def stock_level()
    # to display with colors, use return value of this method as a css class
    if @stock_quantity > 15
      return " "
    elsif @stock_quantity > 1
      return "Low Stock"
    else
      return "Out of Stock"
    end
  end

  def markup()
    markup =  @selling_price - @purchase_price
    return markup
  end

# READ

  def self.all()
    sql = "SELECT * FROM shoes"
    shoes_hash = SqlRunner.run(sql)
    shoes_hash.map {|shoe| Shoe.new(shoe)}
  end


  def self.find_by_id(id)
    sql = "SELECT * FROM shoes WHERE id = $1"
    values = [id]
    shoe = SqlRunner.run(sql, values).first
    return Shoe.new(shoe)
  end

  def self.find_by_brand(brand_id)
    sql = "SELECT * FROM shoes WHERE brand_id = $1"
    values = [brand_id]
    shoes_hash = SqlRunner.run(sql, values)
    shoes_hash.map {|shoe| Shoe.new(shoe)}
  end

# DELETE

  def self.delete_all()
    sql = "DELETE FROM shoes"
    SqlRunner.run(sql)
  end

end
