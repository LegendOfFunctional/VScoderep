module lab06ClassWork
import StdEnv

/*
 1. Compute the average of tuple elements using map.
*/
tupleAverage ::  [(Int, Int)] -> [Real]
tupleAverage list = map (\tuple = toReal (((fst tuple)+(snd tuple))/2) ) list
//Start = tupleAverage [(1,11), (2,7), (3,10)]

/****************************************************************************************************************/

/*
 2. Create using an input list of tuples a new list of tuples like:
	 [(1,1), (2,6), (3,9)] -> [(1,1,2), (2,6,8), (3,9,12)] 
*/

create :: [(Int, Int)] -> [(Int, Int, Int)]
create list = map (\tuple = ((fst tuple), (snd tuple), (fst tuple) + (snd tuple)))  list

//Start =  create [(1,1), (2,6), (3,9)]

create2 :: [(Int, Int)] -> [(Int, Int, Int)]
create2 list = map (\(x, y) = (x, y, x + y)) list
//Start =  create2 [(1,1), (2,6), (3,9), (4,5), (7,8)]

create3 :: [(Int, Int)] -> [(Int, Int, Int)]
create3 list = [((fst tuple), (snd tuple), (fst tuple) + (snd tuple))\\ tuple <- list]
//Start =  create3 [(1,1), (2,6), (3,9), (4,5), (7,8)]

/****************************************************************************************************************/

/*
 3. Given a 2-D list of integer, transform each sublist into a tuple (the first, middle, last element).
*/

extract3 :: [[Int]] -> [(Int, Int, Int)]
extract3 list = [(hd sublist,sublist!!((length sublist)/2),last sublist) \\ sublist <- list]
//Start = extract3 [[1..9], [2..6], [3..11], [1..10]] // [(1,5,9),(2,4,6),(3,7,11),(1,6,10)]
//Start = extract3 [] //[]

/****************************************************************************************************************/

/*
 4. Given a list of lists, transform it tuples of sublist such that two 
   	 continous sublists form pairs 
   	 (if there are odd number of sublist the last has as pair the empty list)
*/

pairs :: [[Int]] -> [([Int],[Int])]
pairs [] = []
pairs [first]  = [(first, [])]
pairs [first, second : list] = [(first, second) : pairs list]
//Start = pairs [[1,2,3], [5,6], [7,8,9,10], [11,3], [1..5]]
//Start = pairs [[1,2,3], [5,6], [7,8,9,10], [11,3]]

/**********************************************************************************************************/

/*
 5. Generate the 13, 10 times as list: [13,13,13,13,13,13,13,13,13,13]
*/
l1 :: [Int]
l1 = [13 \\ counter <-[1..10]]
//Start = l1

/****************************************************************************************************************/

/*
 6. Generate the following list [(1,1),(1,2),(2,1),(2,2)]
*/

l2 :: [(Int, Int)]
l2 = [(v1, v2) \\ v1 <- [1, 2], v2 <- [1, 2]]

//Start = l2

/****************************************************************************************************************/

/*
 7. Generate the list [(0,10),(1,9),�,(10,0)].
*/

l16 :: [(Int, Int)]
l16 = [(b1, b2) \\ b1 <- [0,1..10] & b2 <- [10,9..0]]
//Start = l16

/****************************************************************************************************************/

/*
 8. Generate the following list [(1,3),(1,2),(1,1),(2,3),(2,2),(2,1),(3,3),(3,2),(3,1)]
*/

l3 :: [(Int, Int)]
l3 = [(a1, a2) \\ a1 <- [1, 2, 3], a2 <- [3, 2, 1]]
//Start = l3

/****************************************************************************************************************/

/*
 9. Construct the list [(1,'a'),(2,'b'),�(�,'z')], i.e. pair up numbers with abc letters.
*/

l13 :: [(Int, Char)]
l13 = [(number, letter) \\ number <- [1..28] & letter <- ['a'..'z']]
//Start = l13

/****************************************************************************************************************/

/*
 10. Generate the list [1,2,2,3,3,3,4,4,4,4,...,10,..,10]
*/

l5 :: [Int]
l5 = [number \\ number <- [1..10], counter <- [1..number]]
//Start = l5

/****************************************************************************************************************/

/*
 11. Generate the list [[1],[2,2],[3,3,3],[4,4,4,4],...,[10,..,10]]
*/

l6 :: [[Int]]
l6 =  [[number \\ counter <- [1..number]] \\ number <- [1..10]]
//Start = l6

/****************************************************************************************************************/

/*
 12. Generate 100 even numbers using list comprehensions
*/

l8 :: [Int]
l8 =  [num \\ num <- [1..200] | (isEven num) ]
//Start = l8

/****************************************************************************************************************/

/*
 13. Generate the following list [4, 16, 36, 64, 100, 144, 196, 256, 324, 400]
*/

l9 :: [Int]
//l9 =  [num*num \\ num <- [1..20] | (isEven num) ]
l9 = take 16 [num*num \\ num <- [1..] | (isEven num)]
//l9 = takeWhile (\num = num <= 400) [num*num \\ num <- [1..] | (isEven num) ]
//Start = l9
/****************************************************************************************************************/

/*`
 12. List �dominoes�: [(0,0),(0,1),(1,1),(0,2),(1,2),(2,2),...,(9,9)]
    Domino (1,0) is not in the list because it is already in it as (0,1).
*/

l12 :: [(Int, Int)]
l12 = [(snd, first) \\ first <- [0..9], snd <- [0..first]]
//Start = l12

/****************************************************************************************************************/

/*
 14. Generate a list of length 10 whose elements are False, True, False, True, � (alternating)
*/

l14 :: [Bool]
//l14 = [isEven num \\ num <- [1..10]]
l14 = flatten [truefalse \\ truefalse <- [[False, True]], counter <- [1..5]]
//Start = l14

/****************************************************************************************************************/

/*
 15. Compute the sum of the list of tuples [(1,1), (2,2), (3,3)] -> (6,6)
*/
//unzip
//Start = unzip [(1,1), (2,2), (3,3)]

sumtup :: [(Int, Int)] -> (Int, Int)
//sumtup list = (sum (fst (unzip list)), sum (snd (unzip list))) 
sumtup list = (sum first, sum second) 
where (first, second) = (unzip list)
//Start = sumtup [(1,1), (2,2), (3,3)]

/****************************************************************************************************************/

/*
 16. Make triple tuples like [(1,2,3),(4,5,6),(7,8,9),(10,11,12),(13,14,15)]
*/

tripl :: [(Int, Int, Int)]
tripl = [ (num, num+1, num+2)\\ num <- [1, 4..13]]
//Start = tripl

/****************************************************************************************************************/

/*
 17. Form triple tuples of 3 lists selecting one element from each list.
    E.g. for ([1..10],[20..25],[35..47]) the result is 
    [(1,20,35),(2,21,36),(3,22,37),(4,23,38),(5,24,39),(6,25,40)]
*/

//tri :: ([Int],[Int],[Int]) -> [(Int, Int, Int)]

//Start = tri ([1..10],[20..25],[35..47])

/****************************************************************************************************************/

/*
 18. List the divisors of 90.
*/

l11 :: [Int]
l11 = [num \\num <- [1..90]| 90 rem num == 0 ]
//Start = l11

/****************************************************************************************************************/

/*
 19. Is 123457 a prime number? A nr is prime if only 1 and the numebr divides it.
*/

l15 :: Bool
l15 = (length [num \\num <- [1..123457]| 123457 rem num == 0 ]) == 2
//Start = l15

/****************************************************************************************************************/

/*
 20. Generate 100 pythagoras numbers : [(3,4,5),(6,8,10),(5,12,13),(9,12,15),(8,15,17),(12,16,20)]
*/

l7 :: [(Int, Int, Int)]
l7 = [(num3, num2, num1) \\ num1 <- [1..20], num2 <- [1..num1], num3 <- [1..num2] | (num2^2  == num1^2 + num3^2) || (num3^2  == num2^2 + num1^2) || (num1^2  == num2^2 + num3^2)]
//Start = l7

/****************************************************************************************************************/

/*
 21. Generate a list that contains all (month, day) pairs in a 365-day 
*/

l30 :: [(Int, Int)]
l30 = [(month, days)\\ days <- [1..31], month <- [1..12]]

//Start = l30

/****************************************************************************************************************/

/*************************************************/
/*											 */
/*		       PRACTICE BY YOURSELF              */
/*												 */
/*************************************************/

/*
 22. Generate the list [(1,5),(2,6),(3,7),(4,8),(5,9),(6,10)]
*/

l4 :: [(Int, Int)]
l4 = [(num1, num2 )\\ num1 <- [1..6]& num2 <- [5..10] ]
//Start = l4

/****************************************************************************************************************/

/*
 23.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
*/

l18 :: [(Int, Int)]
l18 = [(num1, num2)\\ num1 <- [1..6]& num2 <- [1..6]]
//Start = l18

/****************************************************************************************************************/

/*
 24. Generate 5 tuples like [(1,2),(2,3),(3,4),(4,5),(5,6)]
*/

increase :: [(Int, Int)]
increase = [(num1, num2)\\ num1 <-[1..6] & num2 <-[2..6] ]
//Start = increase

/****************************************************************************************************************/

/*
 25. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)] 
*/

l19 :: [(Int, Int, Int)]
l19 = [(1*counter,2*counter,3*counter)\\ counter <-[1..5]]
//Start = l19

/****************************************************************************************************************/

/*
 26. List powers of 2 from 1 to 10.
	 hint: use x^y (x at power y)
*/

l10 :: [Int]
l10 =[2 ^ power \\ power <- [1..10]] 
//Start = l10

/****************************************************************************************************************/

/*
 27. Generate a list that contains all (hour, minute) pairs in a day.
*/

l17 :: [(Int, Int)]
l17 = [(minute, hour)\\minute<-[1..60], hour<-[1..24]]
//Start = l17

/****************************************************************************************************************/

/*
 28. write a function duplicates which checks if there are neighbour duplicates in a list
*/

duplic :: [Int] -> Bool
duplic [] = False
duplic [_] = False
duplic [x, y : xs] = [x == y  duplic xs]
//Start = duplic [1, 1] // True
//Start = duplic [2] // False
Start = duplic [1, 2, 3, 4, 5, 6, 7, 8, 9] // False
//Start = duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] // True
//Start = duplic [1,2,3,4,4] // True

/****************************************************************************************************************/

/*
 29. write a function that removes neighbour duplicates in a list
*/

//duplicrem :: [Int] -> [Int] 

//Start = duplicrem [1,1, 0, 5, 0, 0, 6, 0,0,0, 7, 5, 0, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

/****************************************************************************************************************/

/*
 30. transform the sub-sub lists into one list of sublists
*/

//f :: [[[Int]]] -> [[Int]]

//Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

