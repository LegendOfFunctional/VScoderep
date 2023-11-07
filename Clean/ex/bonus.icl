module bonus
import StdEnv

//// bonus points
// 31. (bonus point) rewrite map using foldr
mymap :: (a -> b) [a] -> [b]
mymap f list = foldr (\x y = [f x : y]) [] list

// Start = mymap inc [1..10]


 
  
// 30. (bonus point) Compute the average of a list of float point numbers using the foldr function
// in one line code using one lambda function.
avg :: [Real] -> Real
avg list = foldr (\x y = (x + y)) 0.0 list / toReal (length list)

// Start = avg [16.2, 17.8, 11.5] // 15.1666666666667
// Start = avg [13.0, 40.9] // 26.95


// 31. (bonus point) Write a function that takes a list of numbers and adds the first element,
// subtracts the second element, adds the third element, subtracts the fourth element, so on, 
// in this alternating repetition.
// For example: [2,3,4,5,6,7] -> 2-3+4-5+6-7 = -3

alternatingSum :: [Int] -> Int
alternatingSum [] = 0
alternatingSum [x] = x
alternatingSum [x:y:xs] = x - y + alternatingSum xs

// Start = alternatingSum [2,3,4,5,6,7] // 2-3+4-5+6-7 = -3
// 30. (bonus point) Generate a list that contains all (month, day) pairs in a 365-day 

// daysInMonth1 month1 = daysInMonth x
l30 :: [(Int, Int)]
l30 = [(day, month) \\ month <- [1..12], day <- [1..daysInMonth month]]
  where
    daysInMonth :: Int -> Int
    daysInMonth month
        | month == 4 = 30
        | month == 6 = 30
        | month == 9 = 30
        | month == 11 = 30
        | month == 2 = 28
        | otherwise = 31

// Start = l30

     