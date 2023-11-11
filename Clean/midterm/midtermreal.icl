module midtermreal
import StdEnv
/* Functional Programming mid-term, 2023. Nov 9.
-- This solution was submitted and prepared by
WRITE NAME AND NEPTUN HERE!! <name, neptun>
-- for the Functional Programming course.
-- I declare that this solution is my own work.
-- I have not copied or used third-party solutions.
-- I have not passed my solution to my classmates, 
neither made it public. */
/*1. Given two integers b and e.
Find the number of numbers between and including
b and e, that are divisible by 5.
The 2 numbers can be in increased or decreased order!
Eg. b=4, e=17 -> 5,10,15 -> output: 3 */

cntNotFive :: Int Int -> Int
cntNotFive b e = length[x\\ x<-[b..e]|x rem 5 == 0 ]


// Start = cntNotFive 4 17 // 3
//Start = cntNotFive 6 17 // 2
//Start = cntNotFive 1 5 // 1
//Start = cntNotFive 1 100 // 20
//Start = cntNotFive 42 34 // 2
/*2. Given two positive integers a and b. Print the sum of 
all the digits appearing in the integers between a and b.
The 2 numbers can be in increased or decreased order!
Eg. a=5 and b=11 output: 38 (5+6+7+8+9+1+0+1+1) */
toDigit :: Int -> [Int]
toDigit 0 = []
toDigit x = (toDigit (x / 10) ++ [x rem 10])
sumDigits :: Int Int -> Int
sumDigits num1 num2 = sum[x\\x<-[(toDigit(num1))..(toDigit num2)]]
Start = sumDigits 5 11 // 38
// Start = sumDigits 78 1325 // 16422
//Start = sumDigits 9 5 // 35
//Start = sumDigits 2 2 // 2
/*3. Write a function that computes the product of
adjacent elements in a list and returns the result list.
Eg. [5,1,3,2]  output: [5*1,1*3,3*2] */

adjacent_product :: [Int] -> [Int]
adjacent_product [] = []
adjacent_product [x] = [x]
adjacent_product [x,y:xs] = [n*t\\n <-[x,y:xs] & t<-[y:xs]]
// Start = adjacent_product [1, 2, 3, 4]     // [2,6,12]
//Start = adjacent_product [5, 1, 3, 2]     // [5,3,6]
//Start = adjacent_product [-1, -2, -3, -4] // [2,6,12]
// Start = adjacent_product [10, 0, 5, 2]   // [0,0,10]
//Start = adjacent_product []   // []
//Start = adjacent_product [22]   // []

/*4. Given an integer list having distinct elements, 
for each element, find the total number of elements 
to its right, which are greater than it. 
Eg. [4,6,3,9,7,10] 4 numbers are greater than 4, 
3 nrs are greater than 6, and so on.
output: [4,3,3,1,1,0] */
// surpass :: Int [Int] -> Int 
// surpass x list= maxList x list
// surpasser :: [Int] -> [Int]
// surpasser list = length[surpass x list \\x<-list|surpass x list > x ]
// Start = surpasser [4, 6, 3, 9, 7, 10] // [4,3,3,1,1,0]
//Start = surpasser [23,14,124,6,8,23] // [1,2,0,2,1,0]
//Start = surpasser [] // []
//Start = surpasser [1] // [0]
//Start = surpasser [10,9,8,7,6] // [0,0,0,0,0]

/*5. Write a function that takes a list of integers and 
returns a new list containing double of  
all the elements that are located between the first 
occurrence of the number 5 and the first occurrence 
of the number 8 in the list. 
If either 5 or 8 is not found in the list, return empty list.
Eg. [1,3,5,4,2,7,9,5,8] numbers between first 5 and 8: [4,2,7,9,5]
after double output: [8,4,14,18,10] */

// extract :: [Int] -> [Int]
// extract list1 = [dropWhile (x<>5) (takeWhile (x<>8) list1 ) \\x<-list1 |isMember 5 list1 && isMember 8 list1] //++ takeWhile (\y = y <>8) list1
// Start = extract [1, 3, 5, 4, 2, 7, 9, 5, 8] //  [8,4,14,18,10]
//Start = extract [10, 9, 6, 5, 2, 3, 4, 1] // []
//Start = extract [3, 4, 1, 2, 6, 7, 10, 9] // []
//Start = extract [5, 6, 4, 8, 2, 7, 5, 3, 8] // [12,8]
//Start = extract [1, 5, 3, 4, 2, 7, 8] // [6,8,4,14]
/*6. Given a list of list of integers. From every sublist 
remove element if there is a greater value anywhere to the 
right side of it.
Eg. [5,2,13,3,8] output: [13,8]
The elements that should be removed are 5, 2 and 3.
- 13 is to the right of 5
- 13 is to the right of 2
- 8 is to the right of 3 */
/*
removeIf :: [Int] -> [Int]
removeIf [x] = [x]
removeIf [x,y:xs] = [num\\num<-[x,y:xs]&num2<-[y:xs] | num > num2 && num > removeIf xs ]
removeIfGreaterInRightAll :: [[Int]] -> [[Int]]
removeIfGreaterInRightAll listOfLists = map removeIf listOfLists
*/
//Start = removeIfGreaterInRightAll [[5,2,13,3,8],[1,1,1,1]] // [[13,8],[1,1,1,1]]
//Start = removeIfGreaterInRightAll [[1,2,3,4,5,10], []] // [[10],[]]
//Start = removeIfGreaterInRightAll  [[100,90,80,70,60],[6,5,4],[34]] // [[100,90,80,70,60],[6,5,4],[34]]
/*7. Mary uses shuffle play on her music player. 
She skips songs she doesn't like after 10 seconds, 
but if she likes a song, she listens to the whole song.
Given a list of tuples with name (string), time (integer), 
and if Mary likes the song (Boolean), calculate 
how long she listens music. 
Eg. [("B",177,True),("E",243,True),("H",189,False)]
output: 177+243+10 = 430 */
//Duration :: [(String,Int,Bool)] -> Int
//Start = Duration [] //0
//Start = Duration [("A",120,True),("B",220,False),("C",230,True),("D",180,False),("E",150,False)] //380
//Start = Duration [("B",177,True),("E",243,True),("H",189,False)] //430
//Start = Duration [("B",177,False),("E",166,False),("C",188,False),("H",189,False)] //40
/*8. You are given a list with tuples. Every tuple contains 
a function and a number. Your task is to apply each function 
to the corresponding number, and sum the results together.
The function descriptions are also given.
Eg. [(divide, 4), (remain, 9), (square, 3), (multiply, 3)]
output: (4/2) + (9 rem 3) + (3^2) + (3*5) = 26 */
divide x = x / 2
remain x = x rem 3
square x = x ^ 2
multiply x = x * 5

//sum_fs :: [(Int -> Int, Int)] -> Int
//sum_fs [x:xs] = sum (map x xs)
//Start = sum_fs [(divide, 4), (remain, 9), (square, 3), (multiply, 3)] // 26
//Start = sum_fs [(divide, 4), (divide, 8), (divide, 7)] // 9
//Start = sum_fs [(remain, 3), (remain, 9), (remain, 12), (divide, 2)] // 1
//Start = sum_fs [(square, 1), (multiply, 2), (square, 3), (multiply, 5)] // 45
//Start = sum_fs [] // 0
/*9. You are given a list of tuples with 2 characters. 
Create word1 from first characters of every tuple
and word2 from second characters of every tuple 
then print a string saying: "word1 is cooler than word2" 
Eg. [('A','a'),('B','b'),('C','c'),('D','d')]
Build word1 from first chars -> ABCD word2 -> abcd
output: "ABCD is cooler than abcd" */
//words :: [(Char,Char)] -> String
//words 

//Start = words [('A','a'),('B','b'),('C','c'),('D','d')]//"ABCD is cooler than abcd"
//Start = words [('C','J'),('L','A'),('E','V'),('A','A'),('N','.')]//"CLEAN is cooler than JAVA."
//Start = words [('s','h'),('z','o'),('i','l'),('a','a')]//"szia is cooler than hola"
/*10. A list of (Char, Int) tuples is given, where
the integer of the tuple represents the value of the Char.
Another list of Char is given. Find the sum of all characters
according to the values given in the tuples' list.
If the value of Char cannot be found, use 0.
The input is guaranteed that has no duplicates.
Eg. db = [('f',-4), ('g',4)] and ['g','f','f']
find the sum of ['g','f','f'] by using the tuples:
the value of ('f',-4) and of ('g',4)
output: 4+(-4)+(-4)= -4 */

//sumChar :: [(Char, Int)] [Char] -> Int
//sumChar 
//Start = sumChar [('f',3),('b',9),('c', -3),('a', 5),('d', 8)] ['f','f','d','c','o'] // 11
//Start = sumChar [] ['f','d','c'] // 0
//Start = sumChar [('a',1),('c', 5)] [] // 0
//Start = sumChar [('f',-4), ('g',4)] ['g','f','f'] // -4
/*11. Given a list of landscape heights measurements,
write a function that returns the positions and the values 
of the "peaks" (or local maxima) of the list.
Return the list of the peaks' heights.
Eg. [0, 1, 2, 5, 1, 0] has one peak 5 output: [5]
[3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) output: [6, 3]
Graphically, the second example would look like this:
6|      o                     
5|                            
4|        o                    
3|o   o         o         o      
2|  o         o   o    o          
1|          o       o                                       
  --------------------------
            ^       ^
peaks: |        |
     
The first and last elements of the list are not 
considered peaks (we don't know what is before and after; 
therefore, we don't know if it is a peak or not). */

//peaks :: [Int] -> [Int]
//peaks [x] = [x]
//peaks [x, y] = [x,y]
//peaks [x,y:xs] = [n\\n<-[x,y:xs] | n > y ++ peaks xs ]
//Start = peaks [0,1,2,5,1,0] // [5]
// Start = peaks [3,2,3,6,4,1,2,3,2,1,2,3] // [6,3]
//Start = peaks [5,3,1,8,9,10,3,4,3,5,12] // [10,4]
// Start = peaks [1] // []
//Start = peaks [] // []
//Start = peaks [5,4,3,2,1,3,5,6] // []
//Start = peaks [1,3,2,4,3,5,4,7,5,6,4,5,3,4] // [3,4,5,7,6,5]
/*12. Create a function, that given a Sudoku grid, 
it determines whether every cell has been filled. 
A cell is filled if its value is not 0.
Eg.[
    [5, 3, 4, 6, 7, 8, 9, 1, 2],
    [6, 7, 2, 1, 9, 5, 3, 4, 8],
    [1, 9, 8, 3, 4, 2, 5, 6, 7],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
     [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 8, 4],
    [2, 8, 7, 0, 1, 9, 6, 3, 5],   -> 0 value here means this cell hasn't been filled
    [3, 4, 5, 2, 8, 5, 1, 7, 9]
   ] */
// peaks :: [[Int]] -> Bool
// peaks listOfLists 
// |length[[x\\x<-list | x == 0]\\list<-listOfLists] == 0 = True
// = False

/*
Start = peaks 
 [[5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 0, 1, 9, 6, 3, 5], // -----> 0 here
  [3, 4, 5, 2, 8, 5, 1, 7, 9]] //False
*/
/*
Start = peaks 
  [[5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 3, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 5, 1, 7, 9]] //True
*/
/*
Start = peaks 
  [[5, 3, 0, 6, 7, 8, 9, 1, 2], // -----> 0 here
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 0, 6, 1, 4, 2, 3],  // -----> 0 here
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 0, 7, 3, 1, 9, 6, 3, 5],  // -----> 0 here
  [3, 4, 5, 2, 8, 5, 1, 7, 9]]  //False
*/