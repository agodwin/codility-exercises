#! /usr/bin/env ruby

# https://codility.com/programmers/task/perm_check/
# Lesson 4 - Counting Elements
# Task 1 - Check whether array A is a permutation. 
# Level - Painless

=begin
A non-empty zero-indexed array A consisting of N integers is given.

A permutation is a sequence containing each element from 1 to N once, and only once.

For example, array A such that:
    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2

is a permutation, but array A such that:
    A[0] = 4
    A[1] = 1
    A[2] = 3

is not a permutation, because value 2 is missing.

The goal is to check whether array A is a permutation.

Write a function:

    def solution(a)

that, given a zero-indexed array A, returns 1 if array A is a permutation and 0 if it is not.

For example, given array A such that:
    A[0] = 4
    A[1] = 1
    A[2] = 3
    A[3] = 2

the function should return 1.

Given array A such that:
    A[0] = 4
    A[1] = 1
    A[2] = 3

the function should return 0.

Assume that:
        N is an integer within the range [1..100,000]
        each element of array A is an integer within the range [1..1,000,000,000].

        #### OOPS ####
        The "each element" statement doesn't make any sense???
        
Complexity:
        expected worst-case time complexity is O(N)
        expected worst-case space complexity is O(N), beyond input storage (not 
        counting the storage required for input arguments).

Elements of input arrays can be modified.
Copyright 2009–2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
=end


# a way to toggle logging
def log(msg, flag = false)
    puts msg if flag
end

def solutions(a)
    # quick check of argument
    if (a.length == 0) then
        puts "does not compute!\narray is empty"
        return 0
    end

    if (a.min <= 0) then
        puts "does not compute!\narray has an element out of bounds (less than or equal to zero)"
        return 0
    end

    if (a.max > 100_000) then
        puts "does not compute!\narray has an element out of bounds (greater than 100,000)"
        return 0
    end

    if (a.length != a.uniq.length) then
        puts "does not compute!\narray has duplicate values"
        return 0
    end
    
    # TODO: check for size of the array? [1..100,000]
    
    # duplicate so we don't change argument (pass by reference)
    array = a.dup()

    # sort the elements - make finding unique easier!
    array.sort!()    
    log(array.inspect())
    
    array.each_with_index do | x, i |
       if x != i+1 then
          log("not a permutation")
          return 0
      end
    end
        
    return 1
end

array = [4, 1, 3, 2]
#array = [4, 1, 3]

log(solutions(array), true)

