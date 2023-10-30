module PT1G10
import StdEnv

//write your neptun code here : 

//copying or using any AI tool results in a strict 0 . One or More instances results failing the course.


// write a function that takes a number and returns if it is a lucky number or not
// a lucky number has the following properties
// it is even
// when divided by 5 its remainder is not 0
// when divided by 10 its quotient is not 3

// example : 554 is a lucky number because
// 554 is even , 554 / 5 gives remainder 4 , 554 / 10 gives quotient 55

IsLucky :: Int -> String
IsLucky x
|x rem 2 == 0 && x rem 5 <> 0 && x/10 <> 3 = "lucky"
= "unlucky"
//Start = IsLucky 554 // "lucky"
//Start = IsLucky 123// "unlucky"
// Start = IsLucky 37 // "unlucky"

