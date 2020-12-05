# goal: "find the three entries that sum to 2020 and then multiply those three numbers together."
# 
# `ruby puzzle2.rb`

# Pseudocode
# => 1) Read data from file
# => 2) Convert strings to integers
# => 3) Sort ascending from smallest to largest
# => 4) Iterate through, check every combination if they add up to 2020
# => 5) Break when found and return the product of those numbers

raw_data = File.readlines('input.txt')

integers = raw_data.map(&:to_i).sort!

x, y, z = nil

i = 0
while !(x && y && z)
  x = integers[i]
  y_pairs = integers - [x]
  
  j = 0
  while !(x && y && z)
    y = y_pairs[j]
    z_pairs = y_pairs - [y]
    z = z_pairs.find { |n| x + y + n === 2020 }
    j+= 1
  end

  i+= 1
end

puts "Match found! #{x}, #{y}, and #{z}. Product: #{x*y*z}"
