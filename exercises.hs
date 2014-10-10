diff :: Int -> Int -> Int 
diff x y = abs (x-y)

triangleArea :: Float -> Float -> Float -> Float
triangleArea a b c = 
	let s = (a + b + c) / 2
	in sqrt(s*(s-a)*(s-b)*(s-c))

isSum :: Int -> Int -> Int -> Bool
isSum x y z 
	| x + y == z = True
	| x + z == y = True
	| z + y == x = True
	| otherwise  = False
