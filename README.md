Haskell labs from Computability and Complexity CA320
Lab sheets found at http://www.computing.dcu.ie/~davids/courses/CA320/CA320.html

<h2>Lab 3</h2>

<h3>1. Palindromes</h3>
Write a function ```isPalindrome :: [a] -> Bool``` 
that takes a list and checks if 
it is a palindrome. <br /> For example:
```
> isPalindrome [1,7,5,7,1]
True
> isPalindrome “madam”
True
```
<h3>2. Shortest list</h3>
Write a function ```shortest :: [[a]] -> [a]``` 
that takes a list of lists and returns 
the shortest list in the list (and returns [] if the list of lists is empty). <br /> For example:
```
> shortest [[1,2,3],[1,2],[1,2,3,4,5],[4,3,2,1]]
[1,2]
```
<h3>3. Adding Two Polynomials</h3>
A polynomial in a single variable can be represented rather simply by a list of its 
coefficients. <br /> For example: 
```
[1,7,5,2] represents 2x3 + 5x2 + 7x + 1 
[42,2,1] represents x
2 + 2x + 42 
[-3,0,0,0,1] represents x
4 – 3
[0,-2,0,4] represents 4x3 - 2x
```
Notice how the list index for each element corresponds to the exponent of the term.
Define a type synonym Poly for this representation. Two polynomials can be summed 
by adding the coefficients of corresponding terms. <br /> For example, the sum of ```2x3 + x2 + 1 ```
and ```3x4 + 4x2 – 7 is 3x4 + 2x3 + 5x2 – 6```.
Define a Haskell function ```sumPoly :: Poly -> Poly -> Poly``` that sums two 
polynomials that are represented as above. Take care with the case of polynomials with 
different degrees. <br /> For example:
```
> sumPoly [1,7,5,2] [42,2,1] 
[43,9,6,2] 
> sumPoly [-3,0,0,0,1] [1,7,5,2] 
[-2,7,5,2,1] 
> sumPoly [0,-2,0,4] [1,7,5,2]
[1,5,5,6]
```
<h3>4. Evaluating a Polynomial</h3>
Define a Haskell function ```evalPoly :: Int -> [Int] -> Int``` which, given a 
polynomial and a value for x, will calculate the value of the polynomial for that value of 
x. <br /> For example: 
```
> evalPoly 3 [1,7,5,2] 
121 
> evalPoly (-2) [0,-2,0,4] 
-28 
> evalPoly 4 (sumPoly [0,-2,0,4] [1,7,5,2])
485
```
There are many ways to do this, but an identity that you may find helpful is the 
following:
```
anxn + … + a2x
2 + a1x + a0 = a0 + x(a1 + x(a2 + x(… an) …) )
```
<h2>Lab 2</h2>

<h3>1. Area of a Triangle</h3> <br />
The area of a triangle with sides a, b, c is given by the formula:
```
 _______________ 
√s(s - a)(s - b)(s - c)
```
where
```
s = (a + b + c)/2
```
Design a Haskell function triangleArea to calculate the area of a triangle given the
lengths of its sides. 
The type of triangleArea should be ```Float -> Float -> Float -> Float```
The behaviour of triangleArea should be as follows:
```
> triangleArea 3 4 5
6.0
> triangleArea 1 2 2.5
0.949918
> triangleArea 1 1 (sqrt 2)
0.5
```
<h3>2. Sum Test</h3> <br />
Design a Haskell function isSum that takes three integer arguments and tests whether 
one of them is the sum of the other two.The behaviour of isSum should be as follows:
```
> isSum 1 2 3
True
> isSum 4 9 5
True
> isSum 12 5 7
True
> isSum 23 23 23
False
```
You should start by declaring the type of isSum in your script.

<h3>3. Area of a Triangle (revisited)</h3> <br />
Have you considered what your triangleArea function from exercise 1 will do with 
invalid data? For example, there is no triangle with sides 1, 2, 4. What does GHCi give as 
the value of the expression: ```triangleArea 1 2 4?```

Add to your function definition some checks to handle such invalid data and report an
error if appropriate. You can use the built-in error function for this purpose; it is called 
with a string argument which is the error message. <br /> For example:
```
error “Not a triangle!”
```

The isSum function from exercise 2 is also pretty close to what you need for checking 
that three numbers can really be the sides of a triangle. Begin by modifying this
function.
