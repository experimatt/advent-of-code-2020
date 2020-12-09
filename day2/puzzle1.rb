# goal: "count how many passwords are valid according to their policies."
# 
# `ruby puzzle1.rb`

# Pseudocode
# => 1) Read data from file
# => 2) Iterate over each row;
# =>   a) Parse policies and passwords for each row
# =>   b) Check if password meets policy criteria
# =>   c) Write results to results hash
# => 5) Print results

raw_data = File.readlines('input.txt')

valid = 0

raw_data.each do |line|
  range, letter, password = line.split()
  char = letter[0]
  low, high = range.split('-').map(&:to_i)
  count = password.count(char)
  if count >= low && count <= high
    puts "valid password found for #{line}"
    valid += 1
  end
end

puts "Found #{valid} valid passwords"
