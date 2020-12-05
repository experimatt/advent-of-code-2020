# goal: "find the two entries that sum to 2020 and then multiply those two numbers together."
# 
# `ruby puzzle1.rb`

# Pseudocode
# => 1) Read data from file
# => 2) Convert strings to integers
# => 3) Sort ascending from smallest to largest
# => 4) Iterate through, check every combination if they add up to 2020
# => 5) Break when found and return the product of those numbers

raw_data = File.readlines('input.txt')

integers = raw_data.map(&:to_i).sort!

x, y = nil

i = 0
while !(x && y)
  x = integers[i]
  pairs = integers - [x]
  y = pairs.find { |n| x + n === 2020 }
  i+= 1
end

puts "Match found! #{x} and #{y}. Product: #{x*y}"
