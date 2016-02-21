#! /usr/bin/env ruby

# https://codility.com/programmers/task/max_counters/
# Lesson 4 - Counting Elements
# Task 4 - MaxCounters - Calculate the values of counters after applying all 
#          alternating operations: increase counter by 1; set value of all 
#          counters to current maximum.
# Level - Respectable

=begin
You are given N counters, initially set to 0, and you have two possible 
operations on them:
    increase(X) − counter X is increased by 1,
    max counter − all counters are set to the maximum value of any counter.

A non-empty zero-indexed array A of M integers is given. This array represents 
consecutive operations:
if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
if A[K] = N + 1 then operation K is max counter.

For example, given integer N = 5 and array A such that:

    A[0] = 3
    A[1] = 4
    A[2] = 4
    A[3] = 6
    A[4] = 1
    A[5] = 4
    A[6] = 4
the values of the counters after each consecutive operation will be:

    (0, 0, 1, 0, 0)
    (0, 0, 1, 1, 0)
    (0, 0, 1, 2, 0)
    (2, 2, 2, 2, 2)
    (3, 2, 2, 2, 2)
    (3, 2, 2, 3, 2)
    (3, 2, 2, 4, 2)

The goal is to calculate the value of every counter after all operations.

Write a function:

def solution(n, a)

that, given an integer N and a non-empty zero-indexed array A consisting of 
M integers, returns a sequence of integers representing the values of the 
counters.

The sequence should be returned as:
   a structure Results (in C), or
   a vector of integers (in C++), or
   a record Results (in Pascal), or
   an array of integers (in any other programming language).

For example, given:
    A[0] = 3
    A[1] = 4
    A[2] = 4
    A[3] = 6
    A[4] = 1
    A[5] = 4
    A[6] = 4
    
the function should return [3, 2, 2, 4, 2], as explained above.

Assume that:
N and M are integers within the range [1..100,000];
each element of array A is an integer within the range [1..N + 1].

Complexity:
expected worst-case time complexity is O(N+M);
expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.

Copyright 2009–2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
=end


# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

class Counters
    def initialize(n)
        # create an array of size N, set all array values to 0
        @array = Array.new(n, 0)

        # remember the biggest value we have in the array
        @biggest = 0
    end
    
    def incriment_counter_at(x)
       # PLEASE NOTE:
       #   x is in the range 1 <= x <= array size
       #   so we must adjust it for our zero based array.       

       log("increment counter at #{x}")
       @array[x-1] += 1
       @biggest = @array[x-1] if @array[x-1] > @biggest
       log("biggest value of any counter is #{@biggest}")
    end
    
    def set_all_counters_to_biggest
        log("set all counters to biggest")
        @array.each_index do | i|
            @array[i] = @biggest
        end
    end
    
    def to_a
        @array.inspect
    end        
end


def solutions(number_of_counters, operations_array)
    counters = Counters.new(number_of_counters)
    
    operations_array.each_with_index do | x, i |
       
       # if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
       # if A[K] = N + 1 then operation K is max counter.    
       log("When K is #{i} then A[K] = is #{x}")

       if (1 <= x) && (x <= number_of_counters) then
          counters.incriment_counter_at(x)
            
       elsif x == number_of_counters + 1
          counters.set_all_counters_to_biggest()
            
       else
          log("OOPS - operations array has a value out of bounds", true)
          log("       no change made to any counters", true)
       end

       log("counters are #{counters.to_a()}\n\n")
    end
    
    counters.to_a
end


number_of_counters = 5
operations = [3,4,4,6,1,4,4,]
#operations = [3,4,4,6,1,4,4, -1, 3, 4,]
#operations = [3, 4, 2, 6, 1, 2, 4, 15, 2, 3, 2, 4, 7, 3, 1, 5, 8, 2, 4, 1,]


log("number of counters is #{number_of_counters}", true)
log("operations are #{operations.inspect}\n\n", true)


log(solutions(number_of_counters, operations), true)

