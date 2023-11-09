module sample_4

import StdEnv
/*

//Start = foldr (*) 1 [1..5]
//Start =  foldr (++) [] [[1,2],[3,4],[6,7]]
//Start = foldr (+) 0 (map length [[1,2],[3,4,5],[6,7]])
//Start = zip2 [1,2,3] [4,5,6]
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib(n-2)

*/


//// Disarium number   DONE
/*1.
Given a positive integer number, check if the given number
is a Disarium number or not.
A Disarium number is a number defined by the following:
Sum of its digits powered with their respective position
is equal to the original number.
Example: 135 is a Disarium number, 1^1+3^2+5^3 = 135.
*/
/*
toList :: Int -> [Int]
toList n 
| n < 10 = [n]
= toList (n/10) ++ toList (n rem 10)
*/
//Start = toList 3446

//isDisariumNum :: Int -> Bool
//isDisariumNum n = (sum[x^y\\y<-[1..length(toList n)] & x<-toList n]) ==  n


//Start = isDisariumNum 135 // True
//Start = isDisariumNum 598 // True
//Start = isDisariumNum 518 // True
//Start = isDisariumNum 220 // False
//Start = isDisariumNum 110 // False


//// Harshad numbers
/*2.
Given a list of positive integer numbers, return a list that
contains the Harshad numbers of the list.
A Harshad number is an integer that is divisible by the sum of
its digits when written in that base.
Examples:
200 True, the sum of digits is 2+0+0=2 and 200 is divisible by 2.
171 True, the sum of digits is 1+7+1=9 and 171 is divisible by 9.
*/
//check :: Int -> Bool 
//check n =  n rem (sum (toList n) ) == 0


//Start = check 200

//harshadNums :: [Int] -> [Int]
//harshadNums lists = [x\\x<-lists |check x == True]


//Start = harshadNums ([8, 9, 10, 12, 18, 20, 21, 24, 27, 30] ++ [13..17]) // [8, 9, 10, 12, 18, 20, 21, 24, 27, 30]
//Start = harshadNums ([31..35] ++ [36, 17,40, 42, 45, 13, 48, 50, 54, 11, 60, 63]) // [36, 40, 42, 45, 48, 50, 54, 60, 63]
//Start = harshadNums [] // []

 
//// Leader numbers of a list  After 
/*3.
Given a list of integer numbers, return all the leaders in the list.
A number is leader if it is strictly greater than all the elements
to its right side in a list.
Example: [10,9,14,23,15,0,9] -> [23,15,9]
23 is greater than all the numbers to its right 15,0,9.
15 is greater than all the numbers to its right 0,9.
9 there are no numbers in its right.
*/


check1 :: [Int] -> Bool
check1 [x] = True
check1 [x:xs] = isMember False (map ((>) x) xs)

//Start = check [10, 4, 6, 700]


dom_nums :: [Int] -> [Int]
dom_nums [] = []
dom_nums [x] = [x]
dom_nums [x:xs] 
| check1 [x:xs] == False = [x: dom_nums xs]
= dom_nums xs



//Start = dom_nums [10,9,14,23,15,0,9] // [23,15,9]
//Start = dom_nums [1..10] // [10]
//Start = dom_nums[10,9..1] // [10,9,8,7,6,5,4,3,2,1]
//Start = dom_nums [7,8,10,9,5,3,6,4] // [10,9,6,4]
//Start = dom_nums[] // []


//// Replacing
/*4.
Given the list and a number K, remove all numbers that are divisible by K
and replace all other with reminder by K. Return resulting list.
Example: [1,3,8,6,2], K=3 -> [1,2,2]
3 and 6 are removed as they are divisible by 3.
1,8,2 are replaced with 1, 2, 2 reminders.
*/
//DOne
filteredRem :: Int [Int] -> [Int]
filteredRem k ls = [x rem k\\x<-(filter (\n = (n rem k) <> 0) ls)]

//Start = filteredRem 3 [1,3,8,6,2] // [1,2,2]
//Start = filteredRem 5 [5,10,30] // []
//Start = filteredRem 2 [2,8,3,4,1] // [1,1]
//Start = filteredRem 100 [20,17] // [20,17]

//// GoodNumbers  After done
/*5.
Write a function that takes a list as an argument and
counts how many numbers are:
greater or equal to 10 AND less or equal to 99 AND divisible by 3.
*/
//length (map (\n= (n>=10) && (n<=99) && (n rem 3 == 0)) ls)

countGoodNums :: [Int] -> Int
countGoodNums ls = length [x\\x<-ls|((x >= 10) && (x<=99) && (x rem 3 == 0))]

//Start = countGoodNums [1,12,10,99] // 2

//Start = countGoodNums [12,15,30,33,39,96,99] // 7
//Start = countGoodNums [9, 10, 100, 102, 105] // 0
//Start = countGoodNums [] // 0


//// Valid Triangles DONE
/*6.
Given a list of tuples, each with 3 numbers.
For each tuple check if these 3 numbers
can be used as sides of a triangle,
replace the tuple either with True or False.
3 numbers can be sides of triangles if each pair's
sum is greater than the remaining 3rd number.
A number cannot be a side if it is negative or 0.
*/

isok :: (Int,Int,Int) -> Bool
isok tpl 
| fst3 tpl <= 0 = False 
| snd3 tpl <= 0 = False 
| thd3 tpl <= 0 = False 
= ((fst3 tpl  + snd3 tpl) > thd3 tpl) && ((fst3 tpl  + thd3 tpl) > snd3 tpl) && ((snd3 tpl  + thd3 tpl) > fst3 tpl)  == True


validTriangles :: [(Int,Int,Int)] -> [Bool]
validTriangles ls = map (isok) ls


//Start = validTriangles [] // []
//Start = validTriangles [(3,3,3), (2,4,5), (4,2,5), (3,3,10)] // [True, True, True, False]
//Start = validTriangles [(8,2,4), (3,10,3), (1,2,3)] // [False, False, False]
//Start = validTriangles [(10,8,3), (-10,4,2)] // [True, False]


//// Replicate DONE
/*7.
Given a list of tuples, where each tuple contains a string and a number N.
For each tuple generate a list that contains N copies of the given string.
For negative number N generate empty list.
Example: the tuple ("ab", 3) should be replaced with ["ab","ab","ab"].

*/

stringCopy :: [(String,Int)] -> [[String]]
stringCopy ls = [repeatn (snd x) (fst y) \\x<-ls & y<-ls]


//Start = stringCopy [("X",3),("AA",2)] // [["X","X","X"],["AA","AA"]]
//Start = stringCopy [("Clean", 1),("?!",0),("Empty",-1)] // [["Clean"],[],[]]
//Start = stringCopy [] // []


//// Integers' insertion  after done
/*8.
Given two integers, insert the second integer into the first one.
After each digit considered in the first integer, insert a digit
from the second integer. Both given numbers are of equal length.
Example: 123 321 -> 132231
13 13 -> 1133
*/
//

toList1 :: Int -> [Int]
toList1 n 
| n < 10 = [n]
= toList1 (n/10) ++ toList1 (n rem 10)


//intInsertion1 :: Int Int -> String
//intInsertion1 n1 n2 = (toString(hd (toList1 n1)) +++ toString(hd (toList1 n2))) 
toS :: (Int, Int) -> String
toS tpl = toString(fst tpl) +++ toString(snd tpl) 

//Start = toS (1, 2)

intInsertion :: Int Int -> Int
intInsertion n1 n2 = toInt(foldr (+++) ""( map (toS)(zip2 (toList1 n1) (toList1 n2))))

//Start = intInsertion 234 123
//Start = intInsertion 123 123 // 112233
//Start = intInsertion 123 321 // 132231
//Start = intInsertion 13 13 // 1133
//Start = intInsertion 1 2 // 12
//Start = intInsertion 2 1 // 21


//// Failed-passed students   //done after with help
/*9.
Given list of tuples and an integer value representing the 'pass_marks',
each tuple represents a student (name,marks), write a function which
groups the students into two categories based on their marks obtained in a test.
The function should return a tuple containing the list of the students
who failed, and the list of the students who passed.
Example:
List: [("Ramesh",23), ("Vivek",40), ("Harsh",88), ("Mohammad",60)], pass_marks: 30
Output: ([("Ramesh",23)],[("Vivek",40), ("Harsh",88), ("Mohammad",60)])
--failed-- -------------passed------------------------
'Ramesh' failed as his marks 23 are less than the given number 30, all others passed.
*/
ispassed :: (String, Int) Int -> Bool
ispassed tpl n = snd tpl > n
//Start = ispassed ("ajdh", 45) 30

group_by_marks :: [(String, Int)] Int -> ([(String,Int)], [(String,Int)]) 
group_by_marks ls n = [(a,b)\\(a,b)<-ls|b<n],[(a,b)\\(a,b)<-ls|b>=n]



Start = group_by_marks [("Ramesh",23), ("Vivek",40), ("Harsh",88), ("Mohammad",60)] 30
// ([("Ramesh",23)],[("Vivek",40),("Harsh",88),("Mohammad",60)])
//Start = group_by_marks [("Ramesh",50),("Vivek",20),("Harsh",10),("Abdullah",90),("Mohammed",30),("Ahmed",0),("Othman",70)] 50
// ([("Vivek",20),("Harsh",10),("Mohammed",30),("Ahmed",0)],[("Abdullah",90),("Othman",70)])
//Start = group_by_marks [] 1 // ([],[])


// ispassed :: (String, Int) Int -> Bool
// ispassed tpl n = snd tpl > n
// //Start = ispassed ("ajdh", 45) 30


// group_by_marks :: [(String, Int)] Int -> ([(String,Int)], [(String,Int)])
// group_by_marks [] _ = ([],[]) 
// group_by_marks [x:xs] n 
// | ((ispassed x n) == True) = ([] ,[x, group_by_marks xs n])
// = ([x,group_by_marks xs n],[])


/*
//// Ciphering  DONE
/*10.
Given a list of characters, extract all the vowels and count them.
After that, cipher the list of characters by that count.
Ciphering here means just shift the character by that count.
English vowels are: a, e, i, o, and u.
Example: let's assume that the vowels' count is 2, then:
'a' + 2 = 'c' ... Here we ciphered 'a' into 'c'
'c' + 2 = 'e' ... We did the same as above
For the input ['m', 'o', 'h', 'i','d','o'] count of vowels is 3 o,i,o.
Cipher of the list: ['m', 'o', 'h', 'i','d','o']->['p','r','k','l','g','r'].
*/
*/
cipherList :: [Char] -> [Char]
cipherList ls = map (\n =(toChar(toInt n + lsLen))) ls

where lsLen = (length (filter (\n= n=='a' ||n=='i'||n=='u'||n=='o') ls))


//Start = cipherList ['m', 'o', 'h', 'i','d','o'] // ['p','r','k','l','g','r']
//Start = cipherList ['t', 'a', 'r', 'i', 'q'] // ['v','c','t','k','s']
//Start = cipherList ['b', 'e', 'k', 'a'] // 
//Start = cipherList ['a','b','d','u','l','l','a','h'] // ['d','e','g','x','o','o','d','k']

//*
//// Reachable points
/*11.
Given coordinates of a source point (x1, y1) determine if it is possible to reach
the destination point (x2, y2). All coordinates are positive.
From any point (x, y) there are only two types of valid movements: (x, x + y)
and (x + y, y). Return a Boolean True if it is possible, else return False.
Example: source point: (2, 10)
destination point: (26,12)
output: True (2, 10)->(2, 12)->(14, 12)->(26, 12) is a valid path.
*/


isReachable :: (Int,Int) (Int,Int) -> Bool
isReachable (a,b)(x,y)
| (a > x) || (b > y) = False
| (a == x) && (b == y) = True
=  isReachable (a, a + b) (x,y) || isReachable (a + b, b) (x,y)

//Start = isReachable (2, 10) (26, 12) // True
//Start = isReachable (4, 20) (52, 24) // True
//Start = isReachable (8, 40) (104,48) // True
//Start = isReachable (6, 12) (20, 10) // False
//Start = isReachable (3, 15) (58, 69) // False


//// Evaluate  DONE
/*12.
Given a list of integer numbers representing coefficients of a polynomial,
the polynomial coefficients are given in increasing order of power.
Implement a function which evaluates the polynomial
according to a given value (substituting the given value into it).
You can assume that the given list is not empty.
Example:
List: [2,3,-5,1], the polynomial is 2x^0 + 3x^1 - 5x^2 + 1x^3.
Given value is 1: 2 + (3 * 1) + (-5 * 1^2) + (1 * 1^3) = 1.
*/

evaluate :: [Int] Int -> Int
evaluate ls n = sum [x*(n^y) \\x<-ls & y <-[0..((length ls)-1)]]

//Start = evaluate [2,3,-5,1] 1 // 1
//Start = evaluate [1,-5,2,-8] -2 // 83
//Start = evaluate [1,1,1,1,1,1,1,1] 1 // 8

 

//// Moving digit
/*13.
Complete the function Mover that takes three integers: init, digit and target
and calculates the amount of places the digit, that is equal to the digit in
the number init, has to be shifted to the right in order to get the target number.
It is guaranteed that the digit exists in init and has to be shifted to the right.
Example: 134442 3 144423 -> 4
The digit 3 exists in the init number, and it has to be moved 4 places
in order to get the target number.
*/
numberPos :: [Int] Int Int -> Int
numberPos [] n k = -1
numberPos [x:xs] n k
| n == x = k
= numberPos  xs n (k+1) 

//Start = numberPos [1,2,3] 3 0  

//Start = toList1 234 

Mover :: Int Int Int -> Int
Mover n1 t n2 = (numberPos (toList1 n2) t 0 ) - (numberPos (toList1 n1) t 0) 


// Start = Mover 123 2 132 // 1
//Start = Mover 134442 3 144423 // 4
//Start = Mover 100020001 2 100002001 // 1
