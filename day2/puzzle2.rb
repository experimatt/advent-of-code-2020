# goal: "count how many passwords are valid according to the new either or policy."
# 
# `ruby puzzle2.rb`

# Pseudocode
# => 1) Read data from file
# => 2) Iterate over each row;
# =>   a) Parse policies and passwords for each row
# =>   b) Check if password meets policy criteria
# =>   c) Write results to results hash
# => 5) Print results

raw_data = File.readlines('input.txt')

valid = 0

# line = raw_data[0]
# policy, letter, password = line.split()
# char = letter[0]
# first, second = policy.split('-').map(&:to_i)
# puts line
# puts "#{password[first-1]}; #{password[first-1] == char}"
# puts "#{password[first]}; #{password[first] == char}"
# puts "#{password[first+1]}; #{password[first+1] == char}"

raw_data.each do |line|
  policy, letter, password = line.split()
  char = letter[0]
  first, second = policy.split('-').map(&:to_i)
  if ((password[first] == char) || (password[second] == char)) && !((password[first] == char) && (password[second] == char))
    puts "valid password found for #{line}"
    valid += 1
  end
end

puts "Found #{valid} valid passwords"
