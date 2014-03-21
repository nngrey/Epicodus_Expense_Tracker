class Category

  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM category;")
    categories = []
    results.each do |result|
      name = result['name']
      id = result['id']
      categories << Category.new({ :name => name, :id => id})
    end
    categories
   end

  def ==(another_category)
    self.name == another_category.name
  end

  def save
    results = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
