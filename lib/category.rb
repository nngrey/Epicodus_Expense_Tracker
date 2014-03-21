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

    ## This is the beginning of an attempt at a non-duplication logic for categories...
    # x = ''
    # Category.all.each do |category|
    #   if category['name'] == @name
    #     name_id = category['id']
    #   end
    # end
    # if i = 1
      results = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
      @id = results.first['id'].to_i
    end

end
