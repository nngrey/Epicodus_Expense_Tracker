class Expense

  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes['description']
    @amount = attributes['amount']
    @date = attributes['date']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      amount = result['amount']
      date = result['date']
      expenses << Expense.new({ 'description' => description, 'amount' => amount, 'date' => date})
    end
    expenses
   end

  def ==(another_expense)
    self.description == another_expense.description && self.amount == another_expense.amount && self.date == another_expense.date
  end

  def save
    results = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{@date}') RETURNING id;")
    @id = results.first['id']
  end


  def add_category(category)
    result = DB.exec("INSERT INTO expense_category (expense_id, category_id) VALUES (#{@id}, #{category.id});")
  end
end
