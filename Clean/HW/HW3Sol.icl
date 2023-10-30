module HW3Sol
import StdEnv


/*

	NEPTUN CODE: 
	NAME:
	
	REMEMBER: PLAGIARISM IS ZERO!

	Your submission should not have any errors when running the code.

	It is possible to get partial points for not working code, but please make sure you comment out the errors.

	You should not delete anything from the given code, given test cases should stay the same, but you can add 
	your tests as well. Don't change the given function signatures, however, you can add as many functions as 
	you wish, just make sure to name them appropriately (if function squares the number, call it 'square',
	'second_power', etc. and not 'f' or 'g'). The same goes for variable names. 

	Make sure that you comment all 'Start'-s before submitting the code.
	Hint:You can use some build-in functions like removeDup.

*/

/*1.
	Given a list of integer and return a boolean value which checks 
	when the length of list is even: if the list has
	even, odd, even, odd, even, odd,........(Starting with the even number)
	or
	when the length of list is odd: if the list has
	odd, even, odd, even, odd,........(Starting with the odd number)
	
	For Example: [4,7,2,13,18,23,10,121],the length is 8 (Even) then that list has even odd even odd even odd even, so this should return true.
	otherwise false.
	
*/

isOddEven :: [Int] -> Bool
isOddEven [] = True
isOddEven [x,y:xs]
|isEven(length xs)= isEven x && isOdd y && isOddEven xs
=isOdd x && isOddEven [y:xs]



//Start = isOddEven [4,7,2,13,18,23,10,121] 	// True
//Start = isOddEven [7,2,-13,18,-23,17] 	// False
//Start = isOddEven [4,-8,-3, 2, 5] 		// False
//Start = isOddEven [-1, 0, 1, 0,-3] 		// True

/*2
   You are given a list of integers as input. 
   Only keep the sum of each number.
   For Example:[2,2,3,3,3,5,5,5,5,7,7,11,13,13,13,17,17,17,17] => [4(the sum of two),9(the sum of three),20,14,11,39,68] 
*/

frequency :: [Int] Int -> Int
frequency [] _ = 0
frequency [x:xs] n
|x==n = 1 + (frequency xs n) 
= frequency xs n

helper :: [Int] [Int] -> [Int]
helper lst [a]= [a*(frequency lst a)]
helper lst [x:xs]=[x*(frequency lst x):helper lst xs ]


Keep1 :: [Int] -> [Int]
Keep1 []=[]
Keep1 lst = helper lst (removeDup lst)

//Start = Keep1 [2,2,3,3,3,5,5,5,5,7,7,11,13,13,13,17,17,17,17]//[4,9,20,14,11,39,68]
//Start = Keep1 []//[]
//Start = Keep1 [11,11,22,22,22,33,33,33,33]//[22,66,132]