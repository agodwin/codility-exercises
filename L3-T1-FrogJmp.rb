#! /usr/bin/env ruby

# https://codility.com/programmers/task/frog_jmp/
# Lesson 3 - Time Complexity
# Task 1 - FrogJmp - Count minimal number of jumps from position X to Y.
# Level - Painless

=begin
A small frog wants to get to the other side of the road. The frog is currently 
located at position X and wants to get to a position greater than or equal 
to Y. The small frog always jumps a fixed distance, D.

Count the minimal number of jumps that the small frog must perform to reach its target.

Write a function:

def solution(x, y, d)

that, given three integers X, Y and D, returns the minimal number of jumps 
from position X to a position equal to or greater than Y.

For example, given:

  X = 10
  Y = 85
  D = 30
the function should return 3, because the frog will be positioned as follows:

after the first jump, at position 10 + 30 = 40
after the second jump, at position 10 + 30 + 30 = 70
after the third jump, at position 10 + 30 + 30 + 30 = 100
Assume that:

X, Y and D are integers within the range [1..1,000,000,000];
X ≤ Y.

Complexity:
expected worst-case time complexity is O(1);
expected worst-case space complexity is O(1).
Copyright 2009–2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
=end


def solution(x, y, d)    
    # TODO: test args are greater than zero
    
    # verify we are moving from x to y
    if (x > y) then
        puts "does not compute\nX is greater than Y"
        return 0
    end
    
    puts "trying to get to #{y}"
    distance = x + d
    result = 1
    while distance < y do
        puts "distance is #{distance}"
        distance += d
        result += 1
    end
    
    result
end


x=10
y=85
d=30

puts "The hops count is #{solution(x, y, d)}"
