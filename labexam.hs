-- Exam 2013 --

-- Question 1

ls7 :: [Int]
ls7 = [x | x <- [7,14..200], x `mod` 2 == 0]

-- Question 2

makeList :: Int -> Int -> [Int]
makeList x y = [x..y]

-- Question 3

diff :: (Eq a) => [a] -> [a] -> [a]
diff [x] [] = [x]
diff [] _ = []
diff (x:xs) y
	| x `elem` y = diff xs y
	| otherwise = x:diff xs y

-- Question 4

-- 2010 --

-- Question 1

ls199 :: [Int]
ls199 = [x | x <- [1..99], x `mod` 2 /= 0]

-- Question 2 can't do
-- list of even numbers not evenly divisible by 3
-- whose sum is less than 1000

mySum :: [Int] -> Int
mySum [] = 0
mySum (x:xs) = x + mySum xs

-- Answer got from sample answers. Incorrect imo
whileSumLess :: [Int] -> Int -> Int -> [Int]
whileSumLess (x:xs) sum target
	| sum >= target = []
	| otherwise = x:(whileSumLess xs (sum+x) target)

ans2 = whileSumLess [x | x <- [2,4..], mod x 3 /= 0] 0 1000

-- Question 3 same as diff

-- Question 4 
-- data type for binary trees

-- Question 5
-- function to add an element to a binary tree
