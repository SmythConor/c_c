Haskell labs from Computability and Complexity CA320
Lab sheets found at http://www.computing.dcu.ie/~davids/courses/CA320/CA320.html

<h2>Lab 5</h2>

<h3>1. Monkey Puzzle Sort</h3>
A binary search tree has a value at each node. The left subtree of each node holds only values less 
than at the node, and the right subtree holds only values greater than or equal to that at the node. 
For example, the following is a binary search tree:
```
 5
 / \
 1 7
 \
 3
 ```
This can be represented in Haskell by creating a data type for a binary tree.
```
data BinTree t = Empty | Root t (BinTree t) (BinTree t)
```
```
deriving (Eq, Ord, Show)
```
The above binary tree would then be repersented as:
```
myTree = Root 5 (Root 1 (Empty) (Root 3 Empty Empty)) (Root 7 Empty Empty)
```
Since the leaf node pattern of Root x Empty Empty will occur often we can define this as
```
leaf x = Root x Enpty Empty
```
and hence the above binary tree could be defined as
```
myTree1 = Root 5 (Root 1 (Empty) (Leaf 3)(Leaf 7)
```
(a) > Write a recursive function 
```
addnode :: Ord a => a -> BinTree a -> BinTree a 
```
which, when given an integer and a binary search tree, will add the integer at 
the correct position in the tree. <br /> In order to insert the integer at the correct position, if the 
integer is less than the value at the current node, then it is placed in the left subtree, otherwise 
it is placed in the right subtree. The integer is placed at the first unoccupied node (a leaf). <br /> For 
example, if the integer 4 were added to the above tree, the following tree would result:
```
 5
 / \
 1 7
 \
 3
 \
 4
 ```
(b) Write a recursive function maketree :: Ord a => [a] -> BinTree a which, 
when given a list of integers, will create a binary search tree by inserting the head of the list 
into the correct position in the tree created from the tail of the list. For example, applying 
maketree to the list [4,3,1,7,5] would create the tree given above. This function 
should make use of the addnode function.
(c) The values in a tree can be converted into a list by traversing the tree in a specified order. For 
example, an inorder traversal traverses the left subtree first, then places the root in the result, 
and then traverses the right subtree. Write a recursive function inorder :: BinTree a 
-> [a] which, when given a tree, will return the list giving the result of an inorder traversal 
of the tree. For example, applying inorder to the tree given above would give the list 
[1,3,4,5,7].
(d) Monkey puzzle sort works by creating a binary search tree from a list, and then traversing the 
list in inorder. Write a function mpsort :: Ord a => [a] -> [a] which, when 
given a list of integers, will return the list in ascending numerical order using monkey puzzle 
sort. For example:
mpsort [4,3,1,7,5] = [1,3,4,5,7]
This function should make use of the maketree and inorder functions.
7. Higher Order Sort
Write a higher order sort function hosort :: (a -> a -> Bool) -> [a] -> [a]
which takes two arguments: a relative ordering relation and the list to be sorted. The list should be 
sorted according to the given ordering relation (all consecutive elements in the list satisfy the 
relation). For example:
hosort (>) [4,3,1,7,5] = [7,5,4,3,1]

<h2>Lab 4</h2>

<h3>1. Develop your own list functions.</h3>
Haskell comes with a whole set of useful list functions. The goal of this exercise is to 
write your own version of the following standard Haskell list functions.
```
myAppend :: [a] -> [a] -> [a]
```
Append two lists.
```
myHead :: [a] -> a
```
Extract the first element of a list, which must be non-empty. 
```
myLast :: [a] -> a
```
Extract the last element of a list, which must be finite and non-empty. 
```
myTail :: [a] -> [a]
```
Extract the elements after the head of a list, which must be non-empty. 
```
myInit :: [a] -> [a]
```
Return all the elements of a list except the last one. The list must be non-empty. 
```
myLength :: [a] -> Int
```
returns the length of a finite list as an Int.
```
myReverse :: [a] -> [a]
```
returns the elements of xs in reverse order. xs must be finite. 
```
myConcat :: [[a]] -> [a]
```
Concatenate a list of lists. 
```
mySum :: Num a => [a] -> a
```
computes the sum of a finite list of numbers. 
```
myProduct :: Num a => [a] -> a
```
computes the product of a finite list of numbers. 
```
myMaximum :: Ord a => [a] -> a
```
returns the maximum value from a list, which must be non-empty, finite, and of an ordered type.
```
myMinimum :: Ord a => [a] -> a
```
returns the minimum value from a list, which must be non-empty, finite, and of an ordered type. 
```
myElem :: Eq a => a -> [a] -> Bool
```
the list membership predicate.
```
myDelete :: Eq a => a -> [a] -> [a]
```
removes the first occurrence of x from its list argument. 

<h3>2. Set functions for lists</h3>
This exercise is similar to the last in that we will develop our own version of 2 standard “set-like” list 
functions.
```
myUnion :: Eq a => [a] -> [a] -> [a]
```
returns the list union of the two lists. Duplicates, and elements of the first list, are removed from the the 
second list, but if the first list contains duplicates, so will the result.<br />For example:
```
myUnion [1,3,5,1] [2,2,3,4] == [1,3,5,1,2,4]
```
```
myIntersect :: Eq a => [a] -> [a] -> [a]
```
returns the list intersection of two lists. For example, 
```
myIntersect [1,2,3,4] [2,4,6,8] == [2,4] 
```
If the first list contains duplicates, so will the result. 
```
myIntersect [1,2,2,3,4] [6,4,4,2] == [2,2,4]
```

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
and ```3x4 + 4x2 – 7 is 3x4 + 2x3 + 5x2 – 6```.<br />
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

<h3>1. Area of a Triangle</h3>
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
<h3>2. Sum Test</h3>
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

<h3>3. Area of a Triangle (revisited)</h3>
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
