module PT2G10
import StdEnv

//write your neptun code here : CVDJB8

//copying or using any AI tool results in a strict 0 . One or More instances results failing the course.

//Johny has a cupcake factory and decided to donate some money for every order
// For every order of x amount , johny will donate 5 times the sum of non zero digits in x 

//example
// If the order amount is 20023
// non zero digits are 2,2,3 sum of these -> 2+2+3 = 7
// so johny donates 5 times 7 => 35 $

//make a function that takes the order amount and calculates the donation

Digits :: Int -> Int
Digits x
| x / 10 == 0 = x
= (x rem 10) + Digits (x / 10)

donate :: Int -> Int
donate x
= (Digits x) * 5

//Start = donate 20023 // 35
//Start = donate 20000002 //20
//Start = donate 699 // 120
