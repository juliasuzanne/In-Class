$books = []

class Book
    attr_reader :inventory_number, :title, :author, :price, :stock_num
    attr_writer :price
    
    def initialize(input_options)
      @inventory_number = input_options[:inventory_number]
      @title = input_options[:title]
      @author = input_options[:author]
      @price = input_options[:price]
      @stock_num = input_options[:stock_num]
    end

  def p_item
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "Price: $#{price}"
    puts "# in Stock: #{stock_num}"
  end


end

def create_item(book_name)
  index = $books.length + 1
  puts "Title?"
  title = gets.chomp
  puts "Author?"
  author = gets.chomp
  puts "Price?"
  price = gets.chomp
  puts "QTY in stock?"
  in_stock = gets.chomp
  new_entry = { inventory_number: index, title: title, author: author, price: price, stock_num: in_stock }
  book_name = Book.new(new_entry)
  $books[index - 1] = new_entry
end

def use_app
  p_books
  puts "[C]reate, [U]pdate, [R]ead, [Q]uit"
  user_input = gets.chomp.upcase
  if user_input == "C"
    create_item
    use_app
  elsif user_input == "U"
    puts "Which item would you like to update stock for?"
    #code to add or subtract, select title
    use_app
  elsif user_input == "R"
    puts "Enter inventory number:"
    requested = gets.chomp.to_i
    requested -= 1
    if requested < $books.length
      #print item from array
    else
      puts "item does not exist"
    end
    use_app
  elsif user_input == "Q"
  else
    puts "Please enter a valid input"
    use_app
  end

book1 = Book.new({ inventory_number: 1,
  title: "White Noise",
  author: "Dan DeLillo",
  price: 24.99,
  stock_number: 5 })
book2 = Book.new({
  inventory_number: 2,
  title: "Walking On Water",
  author: "Derrick Jensen",
  price: 12.99,
  stock_num: 10,
})
$books << book1
$books << book2
puts "BOOKS"
use_app
