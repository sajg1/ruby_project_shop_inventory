require_relative("../db/sql_runner")
require_relative("./brand")

class Shoe

  attr_reader :id, :brand_id, :name, :type, :stock_cost
  attr_accessor :stock_quantity, :selling_price

  def initialize(options)

    @name = options['name']
    @type = options['type']
    @stock_quantity = options['stock_quantity'].to_i
    @stock_cost = options['stock_cost'].to_i
    @selling_price = options['selling_price'].to_i
    @brand_id = options['brand_id'].to_i
    @id = options['id'] if options['id'].to_i

  end

# CREATE

  def save()
    sql = "INSERT INTO shoes
    (
      name, type, stock_quantity, stock_cost, selling_price, brand_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    ) RETURNING * "
    values = [@name, @type, @stock_quantity, @stock_cost, @selling_price, @brand_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

#UPDATE

  def update()
    sql = "UPDATE shoes SET
    (
      name, type, stock_quantity, stock_cost, selling_price, brand_id
    )
    =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @type, @stock_quantity, @stock_cost, @selling_price, @brand_id, @id]
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

  def add_stock(num)
    @stock_quantity += num
  end

# READ

  def self.all()
    sql = "SELECT * FROM shoes"
    shoes_hash = SqlRunner.run(sql)
    shoes_hash.map {|shoe| Shoe.new(shoe)}
  end

  # Ask about error when an id that doesn't exist is typed in
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
