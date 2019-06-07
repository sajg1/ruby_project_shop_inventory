require_relative('../db/sql_runner')

class Brand

  attr_reader :name, :id

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
