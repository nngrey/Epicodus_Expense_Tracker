require 'pg'

class Expense

  attr_reader :description, :amount, :date

  def initialize(description, amount, date)
    @description = description
    @amount = amount
    @date = date
  end

  def id
    @id
  end

  def self.all
    results = DB.exec("SELECT * FROM expenses;")
    expenses = []
    results.each do |result|
      description = result['description']
      amount = result['amount']
      date = ['date']
      expenses << Expense.new(description, amount, date)
    end
    expenses
   end

  def ==(another_expense)
    self.description == another_expense.description
  end

  def save
    # DB.exec({:dbnam => 'expense_test'})
    results = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', '#{@amount}', '#{@date}') RETURNING id; ")
    @id = results.first['id'].to_i
  end

end
