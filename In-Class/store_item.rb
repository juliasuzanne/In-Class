$books = [
  { n: 1,
    title: "White Noise",
    author: "Dan DeLillo",
    price: 24.99,
    in_stock: 5 },
  {
    n: 2,
    title: "Walking On Water",
    author: "Derrick Jensen",
    price: 12.99,
    in_stock: 10,
  },
]

def p_books
  index = 0
  while index < $books.length
    puts "#{$books[index][:n]}, #{$books[index][:title]}, #{$books[index][:author]}, #{$books[index][:price]}, #{$books[index][:in_stock]}"
    index += 1
  end
end

def p_item(index)
  puts "Inventory Number: #{$books[index][:n]}"
  puts "Title: #{$books[index][:title]} by #{$books[index][:author]}"
  puts "Price: $#{$books[index][:price]}"
  puts "# in Stock: #{$books[index][:in_stock]}"
end

def update_stock(index)
  puts "What is the new in stock number?"
  new_stock = gets.chomp.to_i
  $books[index][:in_stock] = new_stock
end

def create_item
  index = $books.length + 1
  puts "Title?"
  title = gets.chomp
  puts "Author?"
  author = gets.chomp
  puts "Price?"
  price = gets.chomp
  puts "QTY in stock?"
  in_stock = gets.chomp
  new_entry = { n: index, title: title, author: author, price: price, in_stock: in_stock }
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
    choose_item = gets.chomp.to_i
    choose_item -= 1
    update_stock(choose_item)
    use_app
  elsif user_input == "R"
    puts "Enter inventory number:"
    requested = gets.chomp.to_i
    requested -= 1
    if requested < $books.length
      p_item(requested)
    else
      puts "item does not exist"
    end
    use_app
  elsif user_input == "Q"
  else
    puts "Please enter a valid input"
    use_app
  end
end

puts "BOOKS"
use_app
