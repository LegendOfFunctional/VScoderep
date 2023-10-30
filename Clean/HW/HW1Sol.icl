module HW1_SOL
import StdEnv

/*Ex 1:
 Define the Calculator which contains ('+','-','*','/','%').
 Please return the right result for each expression 
 If meeting other signs,return 0.
 */
 
Calculator :: Int Char Int -> Int
Calculator a sign b
|sign == '*'=a*b
|sign == '+'=a+b
|sign == '-'=a-b
|sign == '/'=a/b
|sign == '%'=a rem b
=0
 
//Start =  Calculator 5 '*' 9 //45
//Start =  Calculator 288 '+' 4567 //4855
//Start =  Calculator 99 '%' 8 //3
//Start =  Calculator 700 '-' 800 //-100
//Start =  Calculator 999999 '/' 10 // 99999
//Start =  Calculator 1 '#' 111 //0

/*
Ex 2:
 Create a function toCelsius that converts Fahrenheit to Celsius.
 Then create a High-temperature warning function,print current temperature 
 and How many degrees to 35 degrees Celsius?
 If it is greater than or equal to 35 degrees Celsius, 
 print "It is currently hot, please pay attention to the heat."
*/

toCelsius :: Real -> Real
toCelsius f 
= (f - 32.0) * 5.0 / 9.0

TempWarning :: Real -> String
TempWarning t
|toCelsius t >= 35.0 ="It is currently hot, please pay attention to the heat."
="Currently "+++ toString(toCelsius t) +++" degrees Celsius."+++ toString(35.0 -(toCelsius t )) +++" degrees away from the heat (35 degrees Celsius)."

//Start=TempWarning 77.0 //"Currently 25 degrees Celsius.10 degrees away from the heat (35 degrees Celsius)."
//Start=TempWarning 95.0 //"It is currently hot, please pay attention to the heat."
//Start=TempWarning 105.0//"It is currently hot, please pay attention to the heat."
//Start=TempWarning 55.0 //"Currently 12.7777777777778 degrees Celsius.22.2222222222222 degrees away from the heat (35 degrees Celsius)."
//Start=TempWarning 0.0 //"Currently -17.7777777777778 degrees Celsius.52.7777777777778 degrees away from the heat (35 degrees Celsius)."
