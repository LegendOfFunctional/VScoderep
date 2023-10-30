module C1
import StdEnv

/*
    Hint : 
        1. The basis of functional programming is functions , if a problem can't be solved
        with one function divide it into multiple functions.
        2. To abort with a message you can use the 'abort' function.
        3. The logic needs to be thought by you , the implementation you can figure out 
        by going through lecture slides and practice material.
*/



/* 1 Write a function padding which will get
1. char - the char used for the padding
2. integer - how many copies will be added 
3. string - the string to pad

For example 
padding '*' 5 "apple" -> "apple*****" 
Hint: Char cannot be joined with a string, you must convert the char to a string */

padding :: Char Int String -> String
padding symbol 0 main = main
padding symbol count main = padding symbol (count-1) (main +++ (toString symbol) )

//Start = padding '*' 5 "apple" // "apple*****" 
//Start = padding '-' 0 "hello" // "hello"
//Start = padding 'W' 7 "" // "WWWWWWW"
//Start = padding 'o' -9 "goodluck" // "number cannot be negative"


//2
// plaigiarism results in failing the task for everyone involved

// write a function that takes two integers x and n and returns the sum of the below series
// 1^x + 2^x + 3^x + ... + n^x

//example: 
// n=3, x=2
// 1^2 + 2^2 + 3^2 = 14

sumSeries :: Int Int -> Int
sumSeries x 0 = 0
sumSeries x n = n^x + sumSeries x (n-1)
//Start = sumSeries 2 3 // 14
//Start = sumSeries 3 4 // 100
//Start = sumSeries 4 5 // 979

//3
// Write a function that takes two integers x and n and returns the sum
// x + x^3 + x^5 + x^7 + ... + x^(2*n-1)

// example: 
// x=2, n=3
// 2 + 2^3 + 2^5 = 42

sums1 :: Int Int -> Int
sums1 x 0 = 0
sums1 x n = x + x^(n + 2) + sums1 x (n-1)

//Start = sums1 3 2 // 42
//Start = sums1 3 4 // 1092
//Start = sums1 0 5 // 0
//Start = sums1 3 5 // 3255

//4
// Write a function that takes two integers x and n and returns the sum
// x^2 + x^4 + ... + x^(2*n)

// example: 
// x=2 n=3, 
// 2^2 + 2^4 + 2^6 = 4+16+64 = 84

sums :: Int Int -> Int
sums x 0 = 0
sums x n = x^(2 * n) + sums x (n - 1)

//Start = sums  3 2 // 84
//Start = sums  4 2 // 340
//Start = sums  0 5 // 0
//Start = sums 3 3 // 819


/* 5. Write GetLastPositive function which returns the last digit of the number if its positive 
and -1 if the number is negative */

//GetLastPositive :: Int -> Int

//Start = GetLastPositive 5856 // 6  
//Start = GetLastPositive 689255 // 5
//Start = GetLastPositive 0 // 0
//Start = GetLastPositive 8 // 8
//Start = GetLastPositive -8554 // -1

/* 6. Given a year, determine if the year is a leap year or not
A year is a leap year if it is divisible by 4 but not divisible by 100.
But a year can be a leap year if it is divisible by 400 (eventhough it is divisible by 100).
If more explanation is needed check out this video - */

//isLeapYear :: Int -> Bool


//Start = isLeapYear 1900 // False
//Start = isLeapYear 1997 // False
//Start = isLeapYear 1996 // True
//Start = isLeapYear 2000 // True

/* 7. Given a decimal number turn it into an octal number.
Octal number has eight as a base instead of 10 in decimal numbers.
In case you do not know the procedure please check out this source -    */

//toOctal :: Int -> Int

//Start = toOctal 1234 // 2322
//Start = toOctal 2023 // 3747
//Start = toOctal 467383847 // 3366733047
//Start = toOctal 0 // 0
//Start = toOctal -10 // "Negative number is not allowed"


/*8
 Theres a football match in Budapest and you are the software engineer of the stadium.
 Every ticket has a code and the code is a number.
 some tickets are VIP tickets and some are normal tickets.
 Make a program for the volunteers so that they can check if the ticket is VIP or not and assign 
 seats accordingly.

 the ticket code is a 6 digit number 
 if the code is even and the sum of teh digits is odd then the ticket is VIP else it is not

 Make a function that takes a ticket code and returns "VIP" if the ticket is VIP and "Normal" if it is not.
 example 
  Input : 123456
 123456 is even , the sum of the digits is 21 , 21 is odd so the ticket is VIP
 so output : "VIP"    
*/

//ticketType :: Int -> String

//Start = ticketType 123456 // "VIP"
// Start = ticketType 224388 // "VIP"
// Start = ticketType 118822 // "Normal"


/*9
 Make a function that takes two numbers and counts the number of even digits in the number formed
 by the sum of the two numbers
 example : 
  Input : 430 561
  430 + 561 = 991  => 9 is a multiple of 3 , other 9 is also a multiple , 1 is not
  so output : 2
*/

//MultipleOf3 :: Int Int -> Int

//Start = MultipleOf3 430 561 // 2
// Start = MultipleOf3 438 561 // 3
// Start = MultipleOf3 96999 0 // 5


/*
	10. A positive integer named 'n' is given and if it is even, then divide by 2 (n/2), if it is odd, then 3n+1.
	Repeat this process by recursion until the value reaches to 1.
	
	Write a function that calculates how many steps went through ODD Number in this process for an integer number given.
	
	For ex: 
	the given integer is 6: 
		as it is even, divide by 2 -> 
		
		1. 6/2 = 3 		-> 1
		2. (3*3)+1 = 10 -> 0
		3. 10/2 = 5 	-> 1
		4. (5*3)+1 = 16 -> 0
		5. 16/2 = 8 	-> 0
		6. 8/2 = 4 		-> 0
		7. 4/2 = 2 		-> 0
		8. 2/2 = 1 		-> 0
		total 8 steps, but only 2 steps went through the odd number, so the function should return 2.	
*/

//CollatzConjunctureOdd :: Int -> Int


//Start = CollatzConjunctureOdd 6		// 2
// Start = CollatzConjunctureOdd 27		// 41
// Start = CollatzConjunctureOdd 9		// 6
// Start = CollatzConjunctureOdd 97		// 43

/*
	11. Given an integer 'n' and calculate the sum of odd number of fibonacci series from F1..Fn.
	For ex: 10 is given.
	Then, the first 10 fibonacci numbers are  1  1  2  3  5  8  13  21  34  55
	Sum of the odd numbers among them is: 1 + 1 + 3 + 5 + 13 + 21 + 55 = 99
	
	Note: Fibonacci series here start from 1. (F1 = 1, F2 = 1, F3 = 2)
*/

//FibonacciOddSeries :: Int -> Int

//Start = FibonacciOddSeries 10		// 99
// Start = FibonacciOddSeries 16		// 1785
// Start = FibonacciOddSeries 0			// 0
// Start = FibonacciOddSeries 20		// 14328

/*
	12. Given a positive integer and a string value belongsto {"Even","Odd"} and write a function that returns the sum of the odd digits if the given string is "Odd" and
	returns the sum of even digits if the given string is "Even".
	
	String equality can be checked with == operator. "Even" == "Even" is true and "Odd" == "Odd" is true.
	
	For ex:
	123046 "Even" -> 2, 4 and 6 are the only Even digits among them, so the result is 12
	123046 "Odd" -> 1 and 3 are the only Odd digits among them, so the result is 4.
*/

//DigitSummation :: Int String -> Int

//Start = DigitSummation 123046 "Odd"		// 4
// Start = DigitSummation 123046 "Even"		// 12
// Start = DigitSummation 745209 "Even"		// 6
// Start = DigitSummation 745209 "Odd"		// 21
// Start = DigitSummation 353 "Odd"			// 11
// Start = DigitSummation 353 "Even"		// 0

