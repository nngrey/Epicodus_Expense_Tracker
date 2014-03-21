require 'spec_helper'

describe Expense do

  describe 'initialize' do
    it 'is initialized with a description, an amount, and a date' do
      test_expense = Expense.new({ 'description' => "haircut", 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense.should be_an_instance_of Expense
      test_expense.description.should eq "haircut"
      test_expense.amount.should eq "$10.50"
      test_expense.date.should eq '2014-03-21'
    end
  end

  describe '.all' do
    it 'starts off with no tasks' do
      Expense.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance of Expense to an array of all expenses' do
      test_expense = Expense.new({ 'description' => 'haircut', 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end

  describe '==' do
    it 'makes rspec indisciminate amongst irrelevant differences' do
      test_expense1 = Expense.new({ 'description' => "haircut", 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense2 = Expense.new({ 'description' => "haircut", 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense1.save
      test_expense2.save
      test_expense1.should eq test_expense2
    end

    it 'recognizes that minor differences in the entry constitute a new entry' do
      test_expense1 = Expense.new({ 'description' => "haircut", 'amount' => '$10.51', 'date' => '2014-03-21'})
      test_expense2 = Expense.new({ 'description' => "haircut", 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense1.save
      test_expense2.save
      test_expense1.should_not eq test_expense2
    end
  end

  describe '#add_category' do
    it 'associates a given expense with one category' do
      test_expense = Expense.new({ 'description' => "Pizza", 'amount' => '$10.50', 'date' => '2014-03-21'})
      test_expense.save
      test_category = Category.new({ 'name' => "restaurant"})
      test_category.save
      test_expense.add_category(test_category)
      test_result = DB.exec("SELECT * FROM expense_category WHERE expense_id = #{test_expense.id} AND category_id = #{test_category.id}")
      test_result.first['expense_id'].should eq test_expense.id
      test_result.first['category_id'].should eq test_category.id
    end
  end
end
