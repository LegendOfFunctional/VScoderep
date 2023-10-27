module HW2
import StdEnv

//Please write your name and neptun code here:  Rauf Suleymnaov CVDJB8
/*
Your submission should not have any errors when running the code.

It is possible to get partial points for not working code, but please make sure you comment out the errors.

You'll receive a total of 100 points when you successfully solve both problems, with 50 points awarded for each.

You should not delete anything from the given code, given test cases should stay the same, but you can add 
your tests as well. Don't change the given function signatures. 

Make sure that you comment all 'Start'-s before submitting the code.
		 
*/

/*
Ex 1: Write a recursive function calculating the sum of the factorial of numbers for specific sequences of numbers.

      Given a non-negative number n, compute the sum of the factorial of numbers based on the following pattern:

      the factorial of n is n!and n!=n*(n-1)*(n-2)*...*2*1
      
      when n is odd number:
      1!+3!+ ... +(n-2)!+n!
      
      when n is even number:
      2!+4!+...+(n-2)!+n!
      
      Essentially this is the special sum of an equal difference series with a difference of 2
*/
// Function to compute the factorial of a number
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


specialFactorialSum :: Int -> Int
specialFactorialSum n
   | n == 0 || n == 1 || n == 2 = n
   | otherwise  = factorial n + specialFactorialSum (n - 2)

//Start = specialFactorialSum 1  // 1! = 1
// Start = specialFactorialSum 2  // 2! = 2
// Start = specialFactorialSum 4  // 2! + 4! = 2 + 24 = 26
//Start = specialFactorialSum 5  // 1! + 3! + 5! = 1 + 6 + 120 = 127





/*Ex2:
       The digit1 obtained as follows: 
       Given a number, sum its digits. 
       Then, sum the digits of the number you obtain,and continue this process until you have a single-digit number. 
       Write a recursive function that finds the digital root of a given positive integer first and then checks if the result is a prime number.
       Hint:You can consider the range of the prime numbers.
*/

sumDigits :: Int -> Int
sumDigits x 
|x < 10 = x 
= sumDigits ((x rem 10) + (x/10))
// Start = sumDigits 1001

primedigitalRoot:: Int -> Bool
primedigitalRoot x
| x == 4 || x == 6 || x == 8 || x == 9 = False
| x / 10 == 0 = True
=primedigitalRoot(sumDigits(x))

//Start = primedigitalRoot 67
//Start = primedigitalRoot 1987       //True (because 1+9+8+7 = 25 and 2+5 = 7 and 7 is Prime)
// Start = primedigitalRoot 12345      //False (because 1+2+3+4+5 = 15 and 1+5 = 6 and 6 is not Prime)
//Start = primedigitalRoot 1001       //True 
//Start = primedigitalRoot 999999999998       //False 