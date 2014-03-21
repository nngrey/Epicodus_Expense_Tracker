require './lib/category'
require './lib/expense'
require 'pg'

DB = PG.connect({:dbname => 'expense'})


def main_menu

puts "\n\n", "*"*30, "BITTERSWEET SYMPHONY (MAIN MENU)", "*"*30

puts "\t1: Enter new Expense",
     "\t2: Display Expenditure Categories",
     "\t3: Bleh",
     "\tx: Exit"

  choice = gets.chomp
  case choice

  when '1'
    new_expense
    gets
    main_menu
  when '2'
    expense_categories
    gets
    main_menu
  when '3'
    bleh
    gets
    main_menu
  when 'x'
    puts "Sayonara"
  else
    puts "invalid input"
    main_menu
  end
end



def new_expense
  puts "Enter a description of the Expense: "
  description = gets.chomp
  print "How much did you spend on #{description}?: $"
  amount = gets.chomp
  puts "What date this expenditure occur?: "
  date = gets.chomp
  puts "Under which category does this expense fall? "
  category = gets.chomp

  new_expense = Expense.new({ :description => description, :amount => amount, :date => date })
  new_expense.save
  new_category = Category.new({:name => category})
  new_category.save

  puts "\nYour #{description} expenditure has been saved to the #{category} category!",
       "\nPress Enter to return to the Main Menu"
end


def expense_categories

  puts

end

main_menu








