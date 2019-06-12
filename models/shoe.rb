require_relative("../db/sql_runner")
require_relative("./brand")
require_relative("./stock_item")

class Shoe

  attr_reader :id, :brand_id, :name, :type, :purchase_price
  attr_accessor :selling_price

  def initialize(options)

    @name = options['name']
    @type = options['type']
    @purchase_price = options['purchase_price'].to_i
    @selling_price = options['selling_price'].to_i
    @brand_id = options['brand_id'].to_i
    @id = options['id'] if options['id'].to_i

  end

# CREATE

  def save()
    sql = "INSERT INTO shoes
    (
      name, type, purchase_price, selling_price, brand_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    ) RETURNING * "
    values = [@name, @type, @purchase_price, @selling_price, @brand_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

#UPDATE

  def update()
    sql = "UPDATE shoes SET
    (
      name, type, purchase_price, selling_price, brand_id
    )
    =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @type, @purchase_price, @selling_price, @brand_id, @id]
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

  def stock_count()
    sql = "SELECT stock_items.quantity FROM stock_items
    WHERE shoe_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first
    return result['quantity'].to_i
  end


  def markup()
    markup_profit =  @selling_price - @purchase_price
    markup_percentage = ((@selling_price- @purchase_price).to_f/ @purchase_price * 100).round(2)
    return "£#{markup_profit} (#{markup_percentage}%)"
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
