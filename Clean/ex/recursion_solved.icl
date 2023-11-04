module recursion
import StdEnv


/*6- Eliminate - 10 points
    Given a list of numbers eliminate the first number of 
    every two numbers in the list, until only one number is left.  
    Input: a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
           a = [2, 4, 6, 8]
           a = [4, 8]
           a = [8] 
*/
aux :: [Int] -> [Int]
aux [] = []
aux [x] = []
aux [x,y:xs] = [y] ++ aux xs


eliminate :: [Int] -> [Int]
eliminate [x]=[x]
eliminate [] = []
eliminate list = eliminate (aux list)


//Start = eliminate [1..9] // [8]
//Start = eliminate [1,2,3,4] // [4]
//Start = eliminate [0] // [0]
//Start = eliminate [] // []

/*1- Unique digits - 10 points
    Given an integer n, return the count of all unique digits of n.
    Input: n = 1232
    Output: 2 (only 1 and 3 are unique - appeared only once in n).
    Input: n = 1111
    Output: 0 (There is no unique digit in n.)
*/
toDigit :: Int -> [Int]
toDigit 0 = []
toDigit x = ([x rem 10] ++ toDigit (x / 10))


isUnique :: Int [Int] -> Bool
isUnique digit digits = length (filter ((==)digit) digits) == 1

count_unique_digits :: Int -> Int
count_unique_digits num = length [x \\ x <- toDigit num | isUnique x listnum]
where listnum = toDigit num

// Start = count_unique_digits 1234 // 4
// Start = count_unique_digits 12325332 // 2
// Start = count_unique_digits 111111 // 0
// Start = count_unique_digits 1 // 1


// 7. Calculate Euler's totient function phi(m).
// Euler's so-called totient function phi(m) is defined as the number of positive
// integers r (1 <= r < m) that are coprime with m.
// Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.
// Two integers a and b are coprime, if the only positive integer that divides (is a divisor of) both of them is 1.
// isCoptime :: int int -> Bool
// isCoptime x y 
// phi :: Int -> Int
// phi
// Start = phi 1 // 1
// Start = phi 10 // 4
// Start = phi 12414 // 4136
// Start = phi 100 // 40
// Start = phi 1000000 // 400000


/*2.
Given a list of positive integer numbers, return a list that
contains the Harshad numbers of the list.
A Harshad number is an integer that is divisible by the sum of
its digits when written in that base.
Examples:
200 True, the sum of digits is 2+0+0=2 and 200 is divisible by 2.
171 True, the sum of digits is 1+7+1=9 and 171 is divisible by 9.
*/

//harshadNums :: [Int] -> [Int]


//Start = harshadNums ([8, 9, 10, 12, 18, 20, 21, 24, 27, 30] ++ [13..17]) // [8, 9, 10, 12, 18, 20, 21, 24, 27, 30]
//Start = harshadNums ([31..35] ++ [36, 17,40, 42, 45, 13, 48, 50, 54, 11, 60, 63]) // [36, 40, 42, 45, 48, 50, 54, 60, 63]
//Start = harshadNums [] // []

/* 10. Clean Sequence
 The Clean sequence is defined in following way:
 s(0) = a
 s(1) = b
 s(2) = c
 and for every k greater than 2:
 s(k) = ( s(k-1)*s(k-2) + s(k-3) ) rem 1000
 
 Given n, a, b and c - generate first n numbers from Clean sequence.
*/



//clean :: Int Int Int Int -> [Int] 

// Start = clean 5 1 2 3 // [1,2,3,5,11]
// Start = clean 11 123 79 3 // [123,79,3,720,957,117,157,126,495,277,647]
// Start = clean 2 1 2 3 // [1,2]
// Start = clean 1 1 2 3 // [1]

/* 8. Good Lists

 Given a list of lists, count how many of the sublists are good lists.
 A list is good if it is empty or its 1st number is odd, 2nd is even, 
 3rd is odd, 4th is even and so on.
 E.g: [[],[1,2,3,4],[8,3,4],[9],[3,4,4]] your function should return
 3 as only [], [1,2,3,4] and [9] are "good".
*/

//isGood :: Int [Int] -> Int

// Start = isGood [[],[1,2,3,4],[8,3,4],[9],[3,4,4]] // 3
// Start = isGood [[1,2,3,4],[3,4,4],[3,42],[12,2,1,2]] // 2
// Start = isGood [[],[1,2,3,4],[],[8,3,4],[1],[2],[9],[3,4,4]] // 5
// Start = isGood [] // 0
