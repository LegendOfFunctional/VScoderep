module mid2_solved

import StdEnv


/* 1. Given two integers b and e.
Find the number of numbers between (and including) 
b and e, that are divisible by 5.
The 2 numbers can be in increased or decreased order!
Eg. b=4, e=17 -> 5,10,15 -> output: 3 */

cntNotFive :: Int Int -> Int
cntNotFive l r
| l > r = cntNotFive r l
| l == r && (r rem 5 == 0) = 1
| l == r = 0
| l rem 5 == 0 = cntNotFive (l+1) r + 1
= cntNotFive (l+1) r

Start = cntNotFive 4 17 // 3
//Start = cntNotFive 6 17 // 2
//Start = cntNotFive 1 5 // 1
//Start = cntNotFive 1 100 // 20
//Start = cntNotFive 42 34 // 2



/*2. Given two positive integers a and b. Print the sum of 
all the digits appearing in the integers between a and b.
The 2 numbers can be in increased or decreased order!
Eg. a=5 and b=11 output: 38 (5+6+7+8+9+1+0+1+1) */

sumDigit :: Int -> Int
sumDigit a
| a < 10 = a
= a rem 10 + sumDigit ( a / 10)

sumDigits :: Int Int -> Int
sumDigits a b
| a < b = sum [sumDigit x \\ x <- [a..b]]
= sum [sumDigit x \\ x <- [b..a]]

//Start = sumDigits 5 11 // 38
//Start = sumDigits 78 1325 // 16422
//Start = sumDigits 9 5 // 35
//Start = sumDigits 2 2 // 2



/*3. Write a function that computes the product of
adjacent elements in a list and returns the result list.
Eg. [5,1,3,2]  output: [5*1,1*3,3*2] */

adjacent_product :: [Int] -> [Int]
adjacent_product [] = []
adjacent_product [x] = []
adjacent_product [x,y: xs] = [x * y: adjacent_product [y:xs]] 
 
//Start = adjacent_product [1, 2, 3, 4]     // [2,6,12]
//Start = adjacent_product [5, 1, 3, 2]     // [5,3,6]
//Start = adjacent_product [-1, -2, -3, -4] // [2,6,12]
//Start = adjacent_product [10, 0, 5, 2]   // [0,0,10]
//Start = adjacent_product []   // []
//Start = adjacent_product [22]   // []



/*4. Given an integer list having distinct elements, 
for each element, find the total number of elements 
to its right, which are greater than it. 
Eg. [4,6,3,9,7,10] 4 numbers are greater than 4, 
3 nrs are greater than 6, and so on.
output: [4,3,3,1,1,0] */

countGreater :: Int [Int] -> Int
countGreater x list = sum [1 \\ a <- list | x < a]

surpasser :: [Int] -> [Int]
surpasser list = [countGreater x (drop i list) \\ x <- list & i <- [1..(length list)]]

//Start = surpasser [4, 6, 3, 9, 7, 10] // [4,3,3,1,1,0]
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

extract :: [Int] -> [Int]
extract lst
| (isMember 5) lst && (isMember 8 lst) = map (\x = x*2) (takeWhile(\x = x<>8) (drop 1 (dropWhile(\x = x<>5) lst))) 
= []

//Start = extract [1, 3, 5, 4, 2, 7, 9, 5, 8] //  [8,4,14,18,10]
//Start = extract [10, 9, 6, 5, 2, 3, 4, 1] // []
//Start = extract [3, 4, 1, 2, 6, 7, 10, 9] // []
//Start = extract [5, 6, 4, 8, 2, 7, 5, 3, 8] // [12,8]
///Start = extract [1, 5, 3, 4, 2, 7, 8] // [6,8,4,14]



/*6. Given a list of lists of integer, remove any 
sublist that contains numbers less than 0, and transform 
all good sublists into 1 or 0 as: if the sum of the 
sublist is an even number, then 1, otherwise, 0.
Eg. [[9,-2,5,0],[2,4,8,5,4],[5,8,3,2],[1,8,0,1], [-1]]
remove any sublist that contains numbers less than 0:
[[2,4,8,5,4],[5,8,3,2],[1,8,0,1]]
check if the sum of the sublist is even:
[[2,4,8,5,4],[5,8,3,2],[1,8,0,1]]
[2,4,8,5,4] => 23 => not Even
[5,8,3,2] => 18 => Even
[1,8,0,1] => 10 => Even 	
transform the sublists into 1 or 0:
output: [0,1,1] */

removeTransform :: [[Int]] -> [Int]
removeTransform list = map (\x | isEven (sum x) = 1 = 0) (filter (\sublist = and (map (\x = x >= 0 ) sublist) ) list)

//Start = removeTransform [[9,-2,5,0],[2,4,8,5,4],[5,8,3,2],[1,8,0,1], [-1]] // [0,1,1]
//Start = removeTransform [[], []] // [1,1]
//Start = removeTransform [[9,4,4],[6,5,4]] // [0,0]
//Start = removeTransform [] // []


/*7. Given a list of list of integers. From every sublist 
remove element if there is a greater value anywhere to the 
right side of it.
Eg. [5,2,13,3,8] output: [13,8]
The elements that should be removed are 5, 2 and 3.
- 13 is to the right of 5
- 13 is to the right of 2
- 8 is to the right of 3 */

hasGreaterInRight :: Int [Int] -> Bool
hasGreaterInRight n list = (filter ((<) n) list)==[]

removeIfGreaterInRight :: [Int] -> [Int]
removeIfGreaterInRight [] = []
removeIfGreaterInRight [x:xs]
|(hasGreaterInRight x xs) = [x : removeIfGreaterInRight xs]
= removeIfGreaterInRight xs

removeIfGreaterInRightAll :: [[Int]] -> [[Int]]
removeIfGreaterInRightAll list = map removeIfGreaterInRight list

//Start = removeIfGreaterInRightAll [[5,2,13,3,8],[1,1,1,1]] // [[13,8],[1,1,1,1]]
//Start = removeIfGreaterInRightAll [[1,2,3,4,5,10], []] // [[10],[]]
//Start = removeIfGreaterInRightAll  [[100,90,80,70,60],[6,5,4],[34]] // [[100,90,80,70,60],[6,5,4],[34]]



/*8. Mary uses shuffle play on her music player. 
She skips songs she doesn't like after 10 seconds, 
but if she likes a song, she listens to the whole song.
Given a list of tuples with name (string), time (integer), 
and if Mary likes the song (Boolean), calculate 
how long she listens music. 
Eg. [("B",177,True),("E",243,True),("H",189,False)]
output: 177+243+10 = 430 */

Play :: [(String,Int,Bool)] -> [Int]
Play []=[]
Play [x:xs]
|thd3 x == False = [10] ++ Play xs
=[snd3 x] ++ Play xs

Duration :: [(String,Int,Bool)] -> Int
Duration list=sum (Play list)

//Start = Duration [] //0
//Start = Duration [("A",120,True),("B",220,False),("C",230,True),("D",180,False),("E",150,False)] //380
//Start = Duration [("B",177,True),("E",243,True),("H",189,False)] //430
//Start = Duration [("B",177,False),("E",166,False),("C",188,False),("H",189,False)] //40



/*9. You are given a list with tuples. Every tuple contains 
a function and a number. Your task is to apply each function 
to the corresponding number, and sum the results together.
The function descriptions are also given.
Eg. [(divide, 4), (remain, 9), (square, 3), (multiply, 3)]
output: (4/2) + (9 rem 3) + (3^2) + (3*5) = 26 */

divide x = x / 2
remain x = x rem 3
square x = x ^ 2
multiply x = x * 5

sum_fs :: [(Int -> Int, Int)] -> Int
sum_fs list = sum (map (\(x, y) = x y) list)

//Start = sum_fs [(divide, 4), (remain, 9), (square, 3), (multiply, 3)] // 26
//Start = sum_fs [(divide, 4), (divide, 8), (divide, 7)] // 9
//Start = sum_fs [(remain, 3), (remain, 9), (remain, 12), (divide, 2)] // 1
//Start = sum_fs [(square, 1), (multiply, 2), (square, 3), (multiply, 5)] // 45
///Start = sum_fs [] // 0



/*10. You are given a list of tuples with 2 characters. 
Create word1 from first characters of every tuple
and word2 from second characters of every tuple 
then print a string saying: "word1 is cooler than word2" 
Eg. [('A','a'),('B','b'),('C','c'),('D','d')]
Build word1 from first chars --> ABCD
word2 --> abcd
output: "ABCD is cooler than abcd" */

words :: [(Char,Char)] -> String
words list = (foldr (+++) "" a)+++" is cooler than "+++(foldr (+++) "" b)
where 
	a = map toString (fst(unzip list))
	b = map toString (snd(unzip list))

//Start = words [('A','a'),('B','b'),('C','c'),('D','d')]//"ABCD is cooler than abcd"
//Start = words [('C','J'),('L','A'),('E','V'),('A','A'),('N','.')]//"CLEAN is cooler than JAVA."
//Start = words [('s','h'),('z','o'),('i','l'),('a','a')]//"szia is cooler than hola"



/*11. A list named "DB" of tuples of (Char, Int) is given, 
where the integer of the tuple represents the value of the Char.
Another list of Char is given. Find the sum of all characters
according to the values given in the "DB".
If the value of Char cannot be found in the "DB", use 0.
The input is guaranteed that has no duplicates.
Eg. DB = [('f',-4), ('g',4)] and ['g','f','f']
find the sum of ['g','f','f'] by using the values of DB.
['g','f','f'] => by the values of DB ('f',-4) and ('g',4)
output: 4+(-4)+(-4)= -4 */

findLetter :: [(Char, Int)] Char -> Int
findLetter [] _ = 0
findLetter [(x,v):ls] c
| x == c = v
= findLetter ls c

sumChar :: [(Char, Int)] [Char] -> Int
sumChar db list = sum [ foldr (\(c,v) e | c == letter = v = e) 0 db \\ letter <- list ]
//sumChar db list = sum [ findLetter db letter \\ letter <- list ]

//Start = sumChar [('f',3),('b',9),('c', -3),('a', 5),('d', 8)] ['f','f','d','c','o'] // 11
//Start = sumChar [] ['f','d','c'] // 0
//Start = sumChar [('a',1),('c', 5)] [] // 0
//Start = sumChar [('f',-4), ('g',4)] ['g','f','f'] // -4



/*12. Given a list of landscape heights measurements,
write a function that returns the positions and the values 
of the "peaks" (or local maxima) of the list.
Eg. [0, 1, 2, 5, 1, 0] has a peak with a value of [5].
[3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) output: [6, 3]

Graphically, the second example would look like this:	
	6|      o                     
	5|                            
	4|        o                    
	3|o   o         o         o      
	2|  o         o   o    o          
	1|          o       o                                       
	  --------------------------
	  1 2 3 4 5 6 7 8 9 10 11 12
	  		^		^
	peaks:	|		|
		     		
The first and last elements of the list are not considered 
peaks (we don't know what is after and before and
therefore, we don't know if it is a peak or not).
Return the list of the peaks heights. */

peaks :: [Int] -> [Int]
peaks [] = []
peaks [x] = []
peaks [x,y] = []
peaks [x,y,z : xs]
| y > (max x z) = [y] ++ (peaks [z:xs])
= peaks [y,z:xs]

//Start = peaks [0,1,2,5,1,0] // [5]
//Start = peaks [3,2,3,6,4,1,2,3,2,1,2,3] // [6,3]
//Start = peaks [5,3,1,8,9,10,3,4,3,5,12] // [10,4]
//Start = peaks [1] // []
//Start = peaks [] // []
//Start = peaks [5,4,3,2,1,3,5,6] // []
//Start = peaks [1,3,2,4,3,5,4,7,5,6,4,5,3,4] // [3,4,5,7,6,5]



/*13. Create a function, that given a Sudoku grid, 
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

checkFull :: [[Int]] -> Bool
checkFull lists = and(map (\list = and( map (\x = x <> 0) list) ) lists)

/*
Start = checkFull 
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
Start = checkFull 
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
Start = checkFull 
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

