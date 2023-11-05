module PT3G10
import StdEnv

//write your neptun code here : CVDJB8

//copying or using any AI tool results in a strict 0 . One or More instances results failing the course.


//Given a list of lists of Integers , write a function that takes a list of lists of integrs and n
// and removes the integer at n position(not index) from every sublist 
// if the list is smaller than n make it [0]
// for simplicityb let's assume n is always more than 0


fx :: [[Int]]  Int -> [[Int]]
fx [] _ = [] 
fx [x:xs] z
|length x < 10 = [[0] : fx xs n_choose_k]
= [(take(z-1) x ++  drop z x) : fx xs z]


// Start = fx [[1, 2, 3], [4, 5], [6, 7, 8, 9]] 2



//Start = fx [[1..5],[2,4..10],[3,4,5,6]] 3 // [[1,2,4,5],[2,4,8,10],[3,4,6]]
//Start = fx [[3,6,8], [1,2] , [1..5]] 4 // [[0],[0],[1,2,3,5]]
//Start =  fx [[3,7],[4],[5,3,2]] 4 // [[0],[0],[0]]