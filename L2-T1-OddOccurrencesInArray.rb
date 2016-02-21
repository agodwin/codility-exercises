#! /usr/bin/env ruby

# https://codility.com/programmers/task/odd_occurrences_in_array/
# Lesson 2 - Array
# Task 1 - OddOccurrencesInArray - Find value that occurs in odd number of elements.
# Level - Painless

=begin 
A non-empty zero-indexed array A consisting of N integers is given. The array 
contains an odd number of elements, and each element of the array can be paired 
with another element that has the same value, except for one element that is 
left unpaired.

For example, in array A such that:

  A[0] = 9  A[1] = 3  A[2] = 9
  A[3] = 3  A[4] = 9  A[5] = 7
  A[6] = 9
the elements at indexes 0 and 2 have value 9,
the elements at indexes 1 and 3 have value 3,
the elements at indexes 4 and 6 have value 9,
the element at index 5 has value 7 and is unpaired.

Write a function:

def solution(a)

that, given an array A consisting of N integers fulfilling the above conditions,
returns the value of the unpaired element.

For example, given array A such that:
  A[0] = 9  A[1] = 3  A[2] = 9
  A[3] = 3  A[4] = 9  A[5] = 7
  A[6] = 9
the function should return 7, as explained in the example above.

Assume that:
N is an odd integer within the range [1..1,000,000];
each element of array A is an integer within the range [1..1,000,000,000];
all but one of the values in A occur an even number of times.

Complexity:
expected worst-case time complexity is O(N);
expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.
Copyright 2009–2016 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
=end

def solution(a)
    # quick check of argument
    if (a.length == 0) then
        puts "does not compute!\narray is empty";
        return -1;
    end

    if (a.length.even?) then
        puts "does not compute!\narray has even number of elements";
        return -1;
    end

    if (a.min <= 0) then
        puts "does not compute!\narray has an element out of bounds (less than or equal to zero)";
        return -1;
    end

    if (a.max > 1_000_000_000) then
        puts "does not compute!\narray has an element out of bounds (greater than 1,000,000,000)";
        return -1;
    end
    
    # TODO: check for size of the array? [1..1,000,000];
    
    # duplicate so we don't change argument (pass by reference)
    array = a.dup();
    
    # sort the elements - make finding unique easier!
    array.sort!();    
    puts array.inspect();
    
    # special case - array has only one element
    if (a.length == 1) then
        return a[0];
    end

    # special case - unique is the first element
    first = 0;
    second = 1;
    if (array[first] != array[second]) then
        puts "looking at array[#{first}] => #{array[first]} and array[#{second}] => #{array[second]}";    
        puts "did not match #{array[first]} != #{array[second]}";    
        return array[first];
    end

    # special case - unique is the last element
    penutimate = array.length-2;
    utimate = array.length-1;
    if (array[penutimate] != array[utimate]) then
        puts "looking at array[#{penutimate}] => #{array[penutimate]} and array[#{utimate}] => #{array[utimate]}";    
        puts "did not match #{array[penutimate]} != #{array[utimate]}";    
        return array[utimate];
    end

    
    # general case - unique is somewhere in the array
    x = 0; 
    while (x < array.length-1)
         puts "looking at array[#{x}] and array[#{x+1}]";    
        
        if (array[x] != array[x+1]) then
            puts "did not match #{array[x]} != #{array[x+1]}"; 
            
            # we are in the middle, which element is different?
            # because of sorting, it will always be the element at array[x]
            return array[x];
        end
        
        puts "    OKAY: did match #{array[x]} == #{array[x+1]}"; 
        x += 2;
    end
end


# TEST: unique in the middle of elements =>
array = [9, 3, 9, 3, 9, 7, 9];
# TEST: unique in the middle of elements => array = [2, 4, 1, 7, 2, 7, 4, 1, 11, 14, 92, 14, 92, 11, 9, 32, 106, 9, 106, 32, 12];
# TEST: unique at beginning => array = [5, 12, 3, 12, 15, 6, 17, 5, 17, 15, 6];
# TEST: unique at end => array = [11, 22, 76, 32, 114, 32, 76, 22, 11];
# TEST: single element => array = [12];


# NEGATIVE TEST: even number of elements => array = [9, 3, 9, 3, 9, 9];
# NEGATIVE TEST: empty array => array = [];
# NEGATIVE TEST: bad data => array = [9, 3, -42, 9, 3, 9, 9];
# NEGATIVE TEST: bad data => array = [9, 3, 1_000_000_001, 9, 3, 9, 9];
# TODO: NEGATIVE TEST: array too big => array.length > 1_000__000 


puts solution(array);

