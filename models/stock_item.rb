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

  def shoe()
    sql = "SELECT * FROM shoes WHERE id = $1"
    values = [@shoe_id]
    result = SqlRunner.run(sql, values).first
    return Shoe.new(result)
  end


    def add_stock(amount)
      @quantity += amount
      update()
    end

    def sell_stock(amount)
      @quantity -= amount
      update()
    end

    def stock_level()
  
      if @quantity > 15
        return "Ok"
      elsif @quantity > 1
        return "Low Stock"
      else
        return "Out of Stock"
      end
    end

    def brand()
      sql = "SELECT brands.name FROM brands
      INNER JOIN shoes
      ON shoes.brand_id = brands.id
      INNER JOIN stock_items
      ON shoes.id = stock_items.shoe_id
      WHERE shoes.id = $1"
      values = [@shoe_id]
      brand = SqlRunner.run(sql, values).first
      return Brand.new(brand)
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

  def self.all_shoes()
    sql = ""
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
