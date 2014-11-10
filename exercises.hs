-- Lab 4 --

-- Question 1



-- Lab 3 --

-- Question 1

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

-- Question 2

shortest :: [[a]] -> [a]
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
		in sqrt(s*(s-a)*(s-b)*(s-c))

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
