module test
import StdEnv

/*---------------------------------------------------------------
-- Functional Programming midterm reretake, 2023. July 7.

-- This solution was submitted and prepared by
-- < NAME NEPTUN > for the midterm reretake programming assignment of
-- the Functional Programming course.

-- I declare that this solution is my own work.

-- I have not copied or used third-party solutions.

-- I have not passed my solution to my classmates, neither made it public.
*/


/* 1. Remove 0
Write a function that removes the zeros from a list. */

remove0 :: [Int] -> [Int]
remove0 list = [x\\x<-list |x <> 0]

// Start = remove0 [0,0,0,0,1,2,3,0,4,0,0,0,5,0,0,0,0,6,7,8,0] // 1,2,3,4,5,6,7,8]

/* 2. Change to 0
Write a  function that changes even numbers to 0 in a list.*/
 
change0 :: [Int] -> [Int]
change0 [] = []
change0 [x:xs] 
| isEven x = [0] ++ change0 xs
= [x] ++ change0 xs

// Start = change0 [1..10] // [1,0,3,0,5,0,7,0,9,0]
// Start = change0 [1,6,4,8,9,10,11,13,16] // [1,0,0,0,9,0,11,13,0]

/* 3. Sum of dubles
Write a function to change to double all elements and sum them up. */

sumdouble :: [Int] -> Int
sumdouble list = sum [x * 2\\x<-list ]
// Start = sumdouble [1..10] // 110

//Use the below lists for the following tasks

Names = ["Louis","Peter","Brian","Stewie"]
Ages = [30,35,5,2]
Relation = ["Wife","Husband","Dog","Baby"]
salary = [1000,1500,1,1]
expense = [1200,200,100,1000]

/* 4. Data processing
Summarize the above data such that the function takes these 5 lists 
and creates a list of tuples, one tuple should contain all info about one person.
input - above 5 lists
output - [("Louis",30,"Wife",1000,1200),("Peter",35,"Husband",1500,200),("Brian",5,"Dog",0,100),("Stewie",2,"Baby",0,1000)] */

summary :: [String] [Int] [String] [Int] [Int] -> [(String,Int,String,Int,Int)]
summary a b c d e = [(n, a, r, s, e) \\ n <- Names & a <- Ages & r <- Relation & s <- salary & e <- expense] 

summaryTuple = summary Names Ages Relation salary expense

//Start = summaryTuple
// [("Louis",30,"Wife",1000,1200),("Peter",35,"Husband",1500,200),("Brian",5,"Dog",1,100),("Stewie",2,"Baby",1,1000)]

/* 5. High expense
Take the previous list of tuples and write a function
to find the person with highest highest expenses.
output - "Louis" */

getExpenses :: (String,Int,String,Int,Int) -> Int
getExpenses (_, _, _, _, expenses) = expenses

getName :: (String,Int,String,Int,Int) -> String
getName (name, _, _, _, _) = name

highExp :: [(String,Int,String,Int,Int)] -> String
highExp l = getName (maxListBy (\el1 el2 -> (getExpenses el1) < (getExpenses el2)) l)

//Start = highExp summaryTuple // "Louis"

/* 6. High ratio
Write a function that takes the previous list of tuples and returns the 
relation of the person whose expense to salary ratio is the maximum. 
output = "Baby" */

getRelation :: (String,Int,String,Int,Int) -> String
getRelation (_, _, relation, _, _) = relation

getSalary :: (String,Int,String,Int,Int) -> Int
getSalary (_, _, _, salary, _) = salary

maxRatio :: [(String,Int,String,Int,Int)] -> String
maxRatio l = getRelation (maxListBy (\el1 -> \el2 -> ((getExpenses el1) / (getSalary el1)) < ((getExpenses el2) / (getSalary el2))  ) l)

myMaxListBy :: (a a -> Bool) [a] -> a
myMaxListBy f [x] = x
myMaxListBy f [x:xs] = internalMyMaxListBy f xs x
where
	internalMyMaxListBy :: (a a -> Bool) [a] a -> a
	internalMyMaxListBy f [] c = c
	internalMyMaxListBy f [el:els] curr
	| (f curr el) = internalMyMaxListBy f els el
	= internalMyMaxListBy f els curr

myMinListBy :: (a a -> Bool) [a] -> a
myMinListBy f [x] = x
myMinListBy f [x:xs] = internalMyMinListBy f xs x
where
	internalMyMinListBy :: (a a -> Bool) [a] a -> a
	internalMyMinListBy f [] c = c
	internalMyMinListBy f [el:els] curr
	| (f el curr) = internalMyMinListBy f els el
	= internalMyMinListBy f els curr

//Start = myMaxListBy (\el1 -> \el2 -> el1 < el2) [1, 123, 1452, 4514, 44, 21341, 2312, 55]

//Start = maxRatio summaryTuple // "Baby"


/* 7. Oldest
Create a function that takes the list of tuple and returns all details 
of who is the oldest in the family, 1 dog year is 8 human years. */

getAge :: (String,Int,String,Int,Int) -> Int
getAge (_, age, relation, _, _)
| relation == "Dog" = age * 8
= age

Oldest :: [(String,Int,String,Int,Int)] -> (String,Int,String,Int,Int)
Oldest l = maxListBy (\el1 -> \el2 -> (getAge el1) < (getAge el2)) l

//Start = Oldest summaryTuple // ("Brian",5,"Dog",1,100)

/* 8. Divisible halfs
Write a function that takes a number and checks if its second half is divisible by the first half
E.g. - 224448 first half -> 224 , second half-> 448, 448 is divisible by 224 so output is True
For simplicity assume the number to be of even length.*/

strToList :: String -> [Char]
strToList s = [c \\ c <-: s]
// strToList s = fromString s

listToStr :: [Char] -> String
listToStr s = toString s

secHalfDiv :: Int -> Bool
secHalfDiv n = ((toInt (listToStr (drop ((length s) / 2) s))) rem (toInt (listToStr (take ((length s) / 2) s)))) == 0
where
	s = strToList (toString n)
	

//Start = getLength -1

//Start = secHalfDiv 224448 // True
//Start = secHalfDiv 224447 // False

/* 9. Occurences modified
Write a function that takes a list of integers modifies it in the following way
if there is more than one occurence of a number it is replaced by the total sum.
E.g. - input [1,4,2,3,2,3,3,3]
occurence of 1 -> 1 so it stays 1
occurence of 2 -> 2 so it becomes 2+2=4
occurence of 3 -> 4 so it becomes 3+3+3+3 = 12
occurence of 4 -> 1 so it stays 4
output - [1,4,4,12,4,12,12,12] */

count :: [a] a -> Int | Eq a
count l el = length (filter (\n -> n == el) l)

occModify :: [Int] -> [Int]
occModify l = map (\x -> x * (count l x)) l

//Start = occModify [1,4,2,3,2,3,3,3] // [1,4,4,12,4,12,12,12]
//Start = occModify [1,2,1,1,1,1,2,2,2,2,3,1,2,3,5] // [6,12,6,6,6,6,12,12,12,12,6,6,12,6,5]

/* 10. L matrix
Write a function that takes a square matrix (list of lists) of Integer 
and returns if it is an L Matrix: all elements in first column and 
last row are 1 and rest are 0. Example:
 1 0 0 0
 1 0 0 0  is L matrix and returns true
 1 0 0 0
 1 1 1 1
 
 1 0 0
 0 0 0   is not L matrix because not all elements of first column are 1
 1 1 1   */

// checkRow :: [Int] -> Bool
// checkRow [] = False
// checkRow [x: xs] = x == 1 && (all (\el -> el == 0) xs)

// checkLastRow :: [Int] -> Bool
// checkLastRow [] = True
// checkLastRow l = all (\el -> el == 1) l

// check:: [Int] Int Int -> Bool
// check l idx len
// | idx == len - 1 = checkLastRow l
// = checkRow l

// LorNot :: [[Int]] -> Bool
// LorNot l = [check x idx (length l) \\ x <- l & idx <- (indexList l)]

Start = LorNot [[1,0,0],[1,0,0],[1,1,1]] // True
//Start = LorNot [[1,0,0],[0,0,0],[1,1,1]] // False
//Start = LorNot [[1,0,0,0],[1,0,0,0],[1,0,0,0],[1,1,1,0]] // False






