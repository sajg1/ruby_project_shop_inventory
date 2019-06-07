require_relative('../db/sql_runner')

class Brand

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'] if options['id']
  end

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

  def self.all()
    sql = "SELECT * FROM brands"
    brands = SqlRunner.run(sql)
    brands.map {|brand| Brand.new(brand)}
  end

  def self.delete_all()
    sql = "DELETE FROM brands"
    SqlRunner.run(sql)
  end
end
