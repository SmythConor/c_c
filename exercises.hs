-- Lab 3 --

-- Question 1

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs

shortest :: [[a]] -> [a]
shortest [xs] = xs
shortest (xs:x) 
	| length xs < length (shortest x) = xs
	| otherwise = shortest x

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
