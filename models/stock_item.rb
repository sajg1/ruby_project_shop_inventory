require_relative('../db/sql_runner')
require_relative('./shoe')

class StockItem

  attr_accessor :quantity
  attr_reader :id, :shoe_id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @quantity = options['quantity'].to_i
    @shoe_id = options['shoe_id'].to_i
  end

#CREATE

  def save()
    sql = "INSERT INTO stock_items
    (
      quantity, shoe_id
    )
    VALUES
    (
      $1, $2
    ) RETURNING * "
    values = [@quantity, @shoe_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id'].to_i
  end

#UPDATE

  def update()
    sql = "UPDATE stock_items SET
    (
      quantity, shoe_id
    )
    =
    (
     $1, $2
    ) WHERE id = $3"
    values = [@quantity, @shoe_id, @id]
    SqlRunner.run(sql, values)
  end

#DELETE

  def delete()
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#READ

  def self.all()
    sql = "SELECT * FROM stock_items"
    stock_items = SqlRunner.run(sql)
    stock_items.map { |stock_item| StockItem.new(stock_item)}
  end

#READ

  def self.find_by_id(id)
    sql = "SELECT * FROM stock_items WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return StockItem.new(result)
  end

# DELETE

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

end
