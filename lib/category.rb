class Category

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM category;")
    categories = []
    results.each do |result|
      categories << Category.new(result)
    end
    categories
   end

  def ==(another_category)
    self.name == another_category.name
  end

  def save
      results = DB.exec("INSERT INTO category (name) VALUES ('#{@name}') RETURNING id;")
      @id = results.first['id']
    end


  def self.list_categories
    results_arr = []
    results = DB.exec("SELECT * FROM category;")
    results.each do |result|
      results_arr << result['name']
    end
    results_arr
  end

  def self.duplicate(name)
    ## This is the beginning of an attempt at a non-duplication logic for categories...
    # category_id = ''
    # Category.all.each do |category|
    #   if category['name'] == @name
    #     category_id = category['id']
    #   end
    # end
    # if category_id != ''
    # new_category = Category.new({'name' => name})
    # new_category.save
    # category_id = new_category.id
  end
end
