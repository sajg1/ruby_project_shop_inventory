require_relative("../db/sql_runner")

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

#CREATE

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
end
