class Expense

  attr_reader :description, :amount, :date, :id

  def initialize(attributes)
    @description = attributes[:description]
    @amount = attributes[:amount]
    @date = attributes[:date]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      amount = result['amount']
      date = result['date']
      id = result['id']
      expenses << Expense.new({ :description => description, :amount => amount, :date => date, :id => id})
    end
    expenses
   end

  def ==(another_expense)
    self.description == another_expense.description && self.amount == another_expense.amount && self.date == another_expense.date
  end

  def save
    results = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{@date}') RETURNING id;")
    @id = results.first['id'].to_i
  end

end
