require_relative('../db/sql_runner')
require_relative('./shoe')
require_relative('./stock_item')

class Brand

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

# CREATE

  def save()
    sql = "INSERT INTO brands
    (
      name
    )
    VALUES
    (
      $1
    ) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

# UPDATE

  def update()
    sql = "UPDATE brands SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

# DELETE

  def delete()
    sql = "DELETE FROM brands WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# READ

  def shoes()
    sql = "SELECT * FROM shoes WHERE brand_id = $1"
    values = [@id]
    shoes_hash = SqlRunner.run(sql, values)
    shoes_hash.map {|shoe| Shoe.new(shoe)}
  end

  def count_stock()
    sql = "SELECT stock_items.quantity FROM stock_items
    INNER JOIN shoes
    ON shoes.id = stock_items.shoe_id
    INNER JOIN brands
    ON brands.id = shoes.brand_id
    WHERE brands.id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.reduce(0) {|sum, result| sum + result["quantity"].to_i }
  end

# READ

  def self.all()
    sql = "SELECT * FROM brands"
    brands = SqlRunner.run(sql)
    brands.map {|brand| Brand.new(brand)}
  end


    def self.find_by_id(id)
      sql = "SELECT * FROM brands WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      brand = Brand.new(result)
      return brand
    end

#DELETE

  def self.delete_all()
    sql = "DELETE FROM brands"
    SqlRunner.run(sql)
  end



end
