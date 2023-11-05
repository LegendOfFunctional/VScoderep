module hof
import StdEnv

/*4- Reverse integers - 10 points
    Given a list of integer numbers, reverse every number in the list.
    Reversing a number means to write its digits in the reversed order. 
    Input:  [1,234,5677,43,0]
    Output: [1,432,7765,34,0] Reverse of 1 is 1    
       Reverse of 234: the digits of 234 in reversed order are 4,3 and 2, 
       and by combining these digits we get the number 432
    Note: reverse of e.g. 230 is 32 NOT 032  
*/
//[toInt(toString(x rem 10) +++ toString (x / 10))\\ x <-list ]
rev_nums :: [Int] -> [Int]
rev_nums list = [reverseDigits x \\ x <- list ]
where 
    reverseDigits n
    | n == 0 = 0
    | n < 10 = n
    = (toInt(toString(n rem 10) +++ toString(reverseDigits (n / 10))))

// Start = rev_nums [1,234,5677,43,0] // [1,432,7765,34,0]
// Start = rev_nums [1..5] // [1,2,3,4,5]
// Start = rev_nums [222..240] 
// [222,322,422,522,622,722,822,922,32,132,232,332,432,532,632,732,832,932,42]
// Start = rev_nums [] // []


/* 9. Symmetrical lists
 Given a list of lists of integers, write a function 
 which returns a list of symmetrical lists, 
 if the sum of the sublist is greater than 10.
*/

symSumGreater10 :: [[Int]] -> [[Int]]
symSumGreater10 list = [(x ++ reverse x) \\ x <- list | sum x > 10]

// Start = symSumGreater10 [[1,2,3],[3,4,5,6],[4,5,1,2]] // [[3,4,5,6,6,5,4,3],[4,5,1,2,2,1,5,4]]
// Start = symSumGreater10 [] // []
// Start = symSumGreater10 [[1..10],[1,2]] // [[1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,3,2,1]]

/* 2. Double Ones

 Given a list of integers, write a function which will keep only the numbers
 that contain at least two '1' digits. For example:
 [1,2,21,121,11,234131,111111,123,0,334] -> [121,11,234131,111111]
*/
toDigit :: Int -> [Int]
toDigit 0 = []
toDigit x = (reverse([x rem 10] ++ toDigit (x / 10)))

hasDouble :: Int -> Bool
hasDouble num = length (filter (\digit = digit ==1) (toDigit num)) >= 2

doubleOne :: [Int] -> [Int]
doubleOne list = filter (hasDouble) list

// Start = doubleOne [1,2,21,121,11,234131,111111,123,0,334] // [121,11,234131,111111]
// Start = doubleOne [12,1,11,33] // [11]
// Start = doubleOne [11,111,21] // [11,111]
// Start = doubleOne [] // []
// Start = doubleOne [21,3,1] // []

/* 7. Property check

 Given a list of tuples, write a function to determine
 whether all of the tuples inside of the list hold the (Even, Odd) property.
 [(2,1),(2,3),(4,1)] = True
*/

holdsTrue :: [(Int, Int)] -> Bool
holdsTrue list = foldr (&&) True (map (\t = isEven(fst t) && isOdd(snd t)) list)


// Start = holdsTrue [(2,1),(2,3),(4,1)] // True
// Start = holdsTrue [(1,3),(2,3),(3,4)] // False
//Start = holdsTrue [] // False

/*4.
Given the list and a number K, remove all numbers that are divisible by K
and replace all other with reminder by K. Return resulting list.
Example: [1,3,8,6,2], K=3 -> [1,2,2]
3 and 6 are removed as they are divisible by 3.
1,8,2 are replaced with 1, 2, 2 reminders.
*/

filteredRem :: Int [Int] -> [Int]
filteredRem k list = map (\n = n rem k)(filter (\n = n rem k <>0 ) list)

// Start = filteredRem 3 [1,3,8,6,2] // [1,2,2]
//Start = filteredRem 5 [5,10,30] // []
//Start = filteredRem 2 [2,8,3,4,1] // [1,1]
//Start = filteredRem 100 [20,17] // [20,17]

/*7.
Given a list of tuples, where each tuple contains a string and a number N.
For each tuple generate a list that contains N copies of the given string.
For negative number N generate empty list.
Example: the tuple ("ab", 3) should be replaced with ["ab","ab","ab"].

*/

stringCopy :: [(String,Int)] -> [[String]]
// stringCopy tuples = map (\t = repeatn (snd t)(fst t)) tuples

// Start = stringCopy [("X",3),("AA",2)] // [["X","X","X"],["AA","AA"]]
//Start = stringCopy [("Clean", 1),("?!",0),("Empty",-1)] // [["Clean"],[],[]]
//Start = stringCopy [] // []