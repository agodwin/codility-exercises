#! /usr/bin/env ruby

# https://codility.com/programmers/task/binary_gap/
# Lesson 1 - Iterations
# Task 1 - BinaryGap - Find longest sequence of zeros in binary representation of an integer.
# Level - Painless


# verify input is a positive integer
user_input = ARGV[0].to_i(); # to_i() will truncate any floating point number
#puts user_input;

#exit(-1) if (user_input <= 0)
if (user_input <= 0) then
    puts "usage: #{__FILE__} <integer>"
    exit -1
end

# convert integer to a string of 1 and 0
binary = user_input.to_s(2);

#binary = 35918340.to_s(2);
#binary = 540936.to_s(2);
#binary = 5412721333.to_s(2);
#binary = 10342.to_s(2);
#binary = 2050.to_s(2);
#binary = 7.to_s(2);
  
puts binary;

i = 0;
max_zero_count = 0;
zero_count = 0;
while (i < binary.length) do
    while ((binary[i] == "0") && (i < binary.length)) do
        zero_count += 1; 
        i += 1;
    end
    if (zero_count > max_zero_count) then
        max_zero_count = zero_count;
    end
    i += 1;
    zero_count = 0;
end

puts max_zero_count;
