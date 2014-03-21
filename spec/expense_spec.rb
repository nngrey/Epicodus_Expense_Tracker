require 'spec_helper'

describe Expense do

  describe 'initialize' do
    it 'is initialized with a description an amount and a date' do
      test_expense = Expense.new("haircut", 10.50, 2014/03/21)
      test_expense.should be_an_instance_of Expense
      test_expense.description.should eq "haircut"
      test_expense.amount.should eq 10.50
      test_expense.date.should eq 2014/03/21
    end
  end

  describe '.all' do
    it 'starts off with no tasks' do
      Expense.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance of Expense to an array of all expenses' do
      test_expense = Expense.new("haircut", 10.50, 2014/03/21)
      test_expense.save
      Expense.all.should eq [test_expense]
    end
  end
end
