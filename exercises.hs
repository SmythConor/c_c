-- Lab 5 -- 

data BinTree t = Empty | Root t (BinTree t) (BinTree t)
	deriving (Eq, Ord, Show)

leaf x = Root x Empty Empty

-- Question 1

addNode :: Ord a => a -> BinTree a -> BinTree a
addNode x Empty = leaf x
addNode x (Root y l r)
	| x < y = Root y (addNode x l) r
	| otherwise = Root y l (addNode x r)

-- Question 2

--makeTree :: Ord a => [a] BinTree a
--makeTree x Empty
--makeTree (x:xs) Empty
--	| addNode 

myTree1 = Root 5 (Root 1 (Empty) (leaf 3)) (leaf 7)
myTree2 = addNode 6 myTree1


-- Lab 4 --

-- Question 1

myAppend :: [a] -> [a] -> [a]
myAppend [] x = x
myAppend (y:ys) x = y:(myAppend ys x)

myHead :: [a] -> a
myHead [] = error "List is empty"
myHead (x:xs) = x

myLast :: [a] -> a
myLast [] = error "List is empty"
myLast [x] = x
myLast (x:xs) = myLast xs

myTail :: [a] -> [a]
myTail [] = error "List is empty"
myTail (x:xs) = xs

myInit :: [a] -> [a]
myInit [] = error "List is empty"
myInit [x] = []
myInit (x:xs) =  x:(myInit xs)

myLength :: [a] -> Int
myLength [] = error "List is empty"
myLength [x] = 1
myLength (x:xs) = 1 + myLength xs

myReverse :: [a] -> [a]
myReverse [] = error "List is empty"
myReverse [x] = [x]
myReverse (x:xs) = (myReverse xs) ++ [x]

myConcat :: [[a]] -> [a]
myConcat [] = [] 
myConcat (x:xs) = x ++ (myConcat xs)

mySum :: Num a => [a] -> a
mySum [] = 0
mySum (x:xs) = x + (mySum xs)

myProduct :: Num a => [a] -> a
myProduct [x] = x
myProduct (x:xs) = x * (myProduct xs)

myMaximum :: Ord a => [a] -> a
myMaximum [] = error "List is empty"
myMaximum [x] = x
myMaximum (x:xs)
	| x > myMaximum xs = x
	| otherwise = myMaximum xs

myMinimum :: Ord a => [a] -> a
myMinimum [] = error "List is empty"
myMinimum [x] = x
myMinimum (x:xs)
	| x < (myMinimum xs) = x
	| otherwise = myMinimum xs

myElem :: Eq a => a -> [a] -> Bool
myElem x [] = False
myElem x (z:zs)
	| x == z = True 
	| otherwise = myElem x zs

myDelete :: Eq a => a -> [a] -> [a]
myDelete x [] = []
myDelete x (z:zs)
	| x == z = zs
	| otherwise = z:(myDelete x zs)

-- Question 2 not my work

myUnion :: (Eq a) => [a] -> [a] -> [a]
myUnion xs [] = xs
myUnion xs (y:ys)
	| (myElem y xs) || (myElem y ys) = myUnion xs ys
	| otherwise = myUnion (myAppend xs [y]) ys

myIntersect :: (Eq a) => [a] -> [a] -> [a]
myIntersect [] _ = []
myIntersect (x:xs) ys
	| myElem x ys = x:(myIntersect xs ys)
	| otherwise = myIntersect xs ys

-- Lab 3 --

-- Question 1

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- Question 2

shortest [x] = x
shortest (x:xs) 
	| length x < length (shortest xs) = x
	| otherwise = shortest xs

-- Question 3

type Poly = [Float]

sumPolys :: Poly -> Poly -> Poly
sumPolys [] p = p
sumPolys p [] = p
sumPolys (x:xs) (y:ys) = (x+y):(sumPolys xs ys)

-- Question 4

evalPoly :: Float-> Poly -> Float
evalPoly _ [z] = z
evalPoly x (z:zs) = z + (x * (evalPoly x zs))

-- Lab 2 --

-- Questions 1 and 3

triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c
	| a + b < c = error "Not a triangle!"
	| b + c < a = error "Not a triangle!"
	| a + c < b = error "Not a triangle!"
	| otherwise =
		let s = (a + b + c) / 2
		in sqrt(s*(s - a)*(s - b)*(s - c))

-- Question 2

isSum :: Int -> Int -> Int -> Bool
isSum x y z 
	| x + y == z = True
	| x + z == y = True
	| z + y == x = True
	| otherwise  = False

-- Lab 1 --

diff :: Int -> Int -> Int 
diff x y = abs (x-y)
