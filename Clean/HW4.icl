module HW4
import StdEnv


	NEPTUN CODE:
	NAME:  

*/

/*1
	Write a program that takes a list of tuples as input. 
	Each tuple consists of a character and an integer. 
	The program should generate a pattern using these tuples. 
	Each line of the pattern is created using the character from the tuple repeated the number of times specified by the integer.

For example:[('x',10),('o',9),('*',8),('#',7),('%',6),('%',6),('#',7),('*',8),('o',9),('x',10)]
           "x x x x x x x x x x
 			o o o o o o o o o
			* * * * * * * *
			# # # # # # #
 			% % % % % %
 			% % % % % %
 			# # # # # # #
 			* * * * * * * *
 			o o o o o o o o o
 			x x x x x x x x x x
 			"
    Hint: "\n" is a new line character.
	
	The integer will always be positive.
*/

generatePattern :: [(Char,Int)] -> String

//Start= generatePattern [('x',10),('o',9),('*',8),('#',7),('%',6),('%',6),('#',7),('*',8),('o',9),('x',10)]
//Start= generatePattern [('x',10),('x',9),('x',8),('x',7),('x',6),('x',5),('x',4),('x',3),('x',2),('x',1)]
//Start= generatePattern [] //""

/*2
	Given a 2 lists, first list is the main list and the second list stored the indices of first list. 
	The returned type is also a list whose original elements' indices are contained in the second list and all the element in the result list should be greater than 0 (remove all the element greater than 0).

	for example: firstList = [4,37,7,-16,9,10,28,-8,0], secondList = [0,2,3,6,8] (indices are given 0-zero based) and the function is "operationFunc",
					first: we take the element with the indices of secondlist, then we get [4,7,-16,28,0]
																index in first list: 		0 2   3  6 8
					third: we take only the element that is greater than 0					[4,7,28]



hof :: [Int] [Int]  -> [Int]


//Start = hof [4,37,7,-16,9,10,28,-8,0] [0,2,3,6,8]			// [4,7,28]
//Start = hof [4,-37,-7,-16,9,10,-28,-8,0] [1,2,3,6,8] 		// []
//Start = hof [4,-37,-7,-16,9,10,-28,-8,0] [0,2,4,6,8]      // [4,9]
