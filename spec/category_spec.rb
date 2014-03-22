require 'spec_helper'

describe Category do

  describe 'initialize' do
    it 'is initialized with a name, an amount, and a date' do
      test_name = Category.new({ 'name' => "leisure"})
      test_name.should be_an_instance_of Category
      test_name.name.should eq "leisure"
    end
  end

  describe '.all' do
    it 'starts off with no tasks' do
      Category.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance of Category to an array of all names' do
      test_name = Category.new({ 'name' => 'leisure'})
      test_name.save
      Category.all.should eq [test_name]
    end
  end

  describe '#==' do
    it 'makes rspec indisciminate amongst irrelevant differences' do
      test_name1 = Category.new({ 'name' => "groceries"})
      test_name2 = Category.new({ 'name' => "groceries"})
      test_name1.save
      test_name2.save
      test_name1.should eq test_name2
    end

    it 'recognizes that minor differences in the entry constitute a new entry' do
      test_name1 = Category.new({ 'name' => "grocerie"})
      test_name2 = Category.new({ 'name' => "groceries"})
      test_name1.save
      test_name2.save
      test_name1.should_not eq test_name2
    end
  end

  describe '#list_categories' do
    it 'displays the name of every category' do
      test_category = Category.new({'name' => 'groceries'})
      test_category.save
      test_category.list_categories.should eq [test_category.name]
    end
  end
end
