module PT4G10x
import StdEnv


// a lottery ticket has 2 parts both having a list of integers
// a person wins the lottery if there is a 0 present at the same position in both the lists

//eg : list 1 = [1,4,3,2,4,2,4,0,7,7,5]
//     list 2 = [1,4,8,9,4,5,9,0,2,1,2]
// at the 8th position in both lists there is a zero so its a winning ticket

//eg [1,2,0,0] [1,0,2,2] 
// there are zeros in both list but not at same position so its a losing ticket

// write a function that takes two integer lists and checks if its a winning combination or not
// digit0 :: (Int, Int)-> String
// digit0 list
// | fst list == snd list = "winner"
// ="loser"
winOrNot :: [Int] [Int] -> String
winOrNot [] []= "loser"
winOrNot[x:xs] [y:ys]
| x == 0 && y == 0 = "winner"
= winOrNot xs ys
// // winOrNot list1 list2 = filter (\x = x == y) list1 list2
//  winOrNot list1 list2 = foldr (+) 0 ["winner"\\x<-list1 & y<-list2| x == 0 && y == 0]
Start = winOrNot [1,4,3,2,4,2,4,8,7,7,5] [1,4,8,9,4,5,9,0,2,1,2] // "loser"
//Start = winOrNot [1,4,3,2,4,2,4,0,7,7,5] [1,4,8,9,4,5,9,0,2,1,2] // "winner"
//Start = winOrNot [1,0,4,0] [0,1,0,8] // "loser"