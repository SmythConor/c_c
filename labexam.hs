-- Redo of 2013 Lab Exam

-- Question 1
-- Write an expression that evaluates to a list of the even numbers that are a 
-- multiple of 7 and lenn than 200

myNums = [x | x <- [1..200], x `mod` 7 == 0]

-- correct imo

-- Question 2
-- Write a function that takes two integers and evaluates to a list of integers 
-- between the first integer and the second integer, 
-- including the first and second integers

myIntags :: Int -> Int -> [Int]
myIntags x y = [x..y]

-- correct imo

-- Question 3
-- Write a function, diff that takes two lists and returns a list 
-- that is all the elements of the first list that are not in the second list,
-- eg. diff [1,2,3,4,5,6,7] [2,4,6,8] evaluates to [1,3,5,7]

diff :: [Int] -> [Int] -> [Int]
diff [] _ = []
diff (x:xs) y
	| x `elem` y = diff xs y
	| otherwise = x:(diff xs y)

-- correct imo

-- Question 4
-- Write a data type for a binary tree

--data BinTree t = Empty | Root t (BinTree t) (BinTree t)
--	deriving(Eq, Ord, Show)

-- correct imo

-- misc

leaf x = Root x Empty Empty

--

-- Question 5
-- Write a function that converts a binary tree into a list by doing a 
-- postorder traversal of the binary tree. 
-- Remember a postoreder traversal visits the 
-- left child then the right child and then the parent node

postorder :: BinTree a -> [a]
postorder Empty = []
postorder (Root x l r) = postorder l ++ postorder r ++ [x]

-- correct imo

myTree = Root 5 (Root 1 (Empty) (Root 3 Empty Empty)) (Root 7 Empty Empty)
	
-- Redo of 2010 Lab exam

-- Question 1
-- List of odd numbers from 1 to pp

myNums2 = [x | x <- [1,3..99]]--, x `mod` 2 /= 0]

-- correct imo

-- Question 2
-- List of even numbers not evenly divisible of 3 whose sum less than 1000

whileLess :: [Int] -> Int -> Int -> [Int]
whileLess (x:xs) y z
	| y > z = []
	| otherwise = x:(whileLess xs (y + x) z)


-- Still canny do :'(

-- Question 4

data BinTree t = Empty | Root t (BinTree t) (BinTree t)
	deriving (Eq, Ord, Show)

-- Question 5

addNode :: Ord a => a -> BinTree a -> BinTree a
addNode x Empty = leaf x
addNode x (Root t l r)
	| x < t = Root t (addNode x l) r
	| otherwise = Root t l (addNode x r)

myTree2 = addNode 6 myTree 
myTree1 = postorder myTree2

---- Exam 2013 --
--
---- Question 1
--
--ls7 :: [Int]
--ls7 = [x | x <- [7,14..200], x `mod` 2 == 0]
--
---- Question 2
--
--makeList :: Int -> Int -> [Int]
--makeList x y = [x..y]
--
---- Question 3
--
--diff :: (Eq a) => [a] -> [a] -> [a]
--diff [x] [] = [x]
--diff [] _ = []
--diff (x:xs) y
--	| x `elem` y = diff xs y
--	| otherwise = x:diff xs y
--
---- Question 4 Needs to be learned. Comes up every year xD
--
--data BinTree t = Empty | Root t (BinTree t) (BinTree t)
--	deriving (Eq, Ord, Show)
--
---- 2010 --
--
---- Question 1
--
--ls199 :: [Int]
--ls199 = [x | x <- [1..99], x `mod` 2 /= 0]
--
---- Question 2 can't do
---- list of even numbers not evenly divisible by 3
---- whose sum is less than 1000
--
--mySum :: [Int] -> Int
--mySum [] = 0
--mySum (x:xs) = x + mySum xs
--
---- Answer got from sample answers. Incorrect imo
--whileSumLess :: [Int] -> Int -> Int -> [Int]
--whileSumLess (x:xs) sum target
--	| sum >= target = []
--	| otherwise = x:(whileSumLess xs (sum+x) target)
--
--ans2 = whileSumLess [x | x <- [2,4..], mod x 3 /= 0] 0 1000
--
---- Question 3 same as diff
--
---- Question 4 
---- data type for binary trees
--
--data BinTree t = Empty | Root t (BinTree t) (BinTree t)
--
---- Question 5
---- function to add an element to a binary tree
