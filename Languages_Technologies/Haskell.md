# Glasgow Haskell Compiler
> The Glasgow Haskell Compiler (GHC) is an open-source native code compiler for the functional programming language Haskell. It's the most popular compiler for Haskell.

### Start GHC's interactive mode
```bash
# In a terminal
ghci
```

### Load Haskell script
```bash
# Load HelloWorld.hs from the current directory
:l HelloWorld   
```

# Print
```haskell
show variable
```

# Math 
> Exactly the same is typing normal math in other programming languages
```haskell
-- Mod
24 `mod` 7 -- 3

-- Exponential
4^2 -- 16.0
```

### Common built-in Math functions
```haskell
min x y -- min(x, y)
max x y -- max(x, y)

subtract y x -- x - y
div x y -- x // y (integer division)

succ x  -- x + 1
compare x y -- returns GT/LT/EQ

-- Examples
succ 9 + max 5 4 + 1 -- 16
```

# Boolean Values
```haskell
True && False
False || True
not False
not (True && False)

-- Check for equality
"hello" == "hello"

-- Check for inequality
"hello" /= "Hello"

-- Check for odd/even
odd 8   -- False
even 8  -- True
```

# Conditionals
```haskell
-- The else part is mandatory since every function should return some value
if expression
then value1
else value2
```

# Types
- Check types
```haskell
:t value

-- Examples
:t 'a' -- 'a' :: Char
:t "Hello" -- "Hello" :: String
:t fst -- fst :: (a, b) -> a
```

- Common types
    - `Int` : Integer in range -2^63, 2^63
    - `Integer` : Integer without range
    - `Float` : real floating-point number with single precision
    - `Double`: real floating point number with double precision
    - `Bool` : Boolean type
    - `Char` : Unicode character

- Parse string 
```haskell
read "5" :: Int -- 5
read "3.5" :: Double -- 3.5
read "[1, 2, 3]" :: [Int] --[1, 2, 3]
```

- Check bound of types
```haskell
minBound :: Int -- -9223372036854775808
maxBound :: Int -- 9223372036854775807
```

# Variable assignments with `let`
> TODO: Fill this section with explanation
```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerOrEqual = filter (<= x) xs
        larger = filter (> x) xs
    in  quicksort smallerOrEqual ++ [x] ++ quicksort larger
```

# Functions
- Function Name

**Cannot** begin with capital letters.

Apostrophe (`'`) is a valid character to use in a function name. We usually use `'` to denote either a *strict* version of a function (i.e. one that isn't lazy) or a slightly modified version of a function or variable with a similar name.

- Declaration
> Parameters and return type are separated by `->` with the return type always coming last in the declaration
```haskell
-- Define function hello that take 0 param
hello :: String
hello = "Hello World"

-- Define function doubleMe that take 1 param
doubleMe :: Int -> Int -> Int
doubleMe x = x + x

-- Define function doubleUs that take 2 params
-- equiv to doubleUs x y = doubleMe x + doubleMe y
doubleUs :: Int -> Int -> Int
doubleUs x y = x * 2 + y * 2 

-- Define function that takes a function and 1 param
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
applyTwice (++ " HAHA") "HEY" -- "HEY HAHA HAHA"
```

- Pattern Matching
```haskell
-- When the passed arg conforms to a specified pattern, the corresponding function body will be used

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- Example factorial
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- You can match with the empty list `[]`
-- A pattern like `x:xs` will bind the head of the list to `x` and the rest of it to `xs`
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

-- As-patterns match the list elems as usual but you can easily access the original list
-- <original list name>@<pattern>
firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
```

- Guards (replace complex `if-else` block)
```haskell
-- `otherwise` clause can be omitted

bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, eat more!"
    | bmi <= normal = "Looking good!"
    | bmi <= fat    = "You're overweight. Let's work out together!"
    | otherwise     = "You're obese. Go see a doctor."
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
-- for `where` clauses, all variables need to align in 1 column, so Haskell knows that they belong to the same block         
-- We can refactor it to (skinny, normal, fat) = (18.5, 25.0, 30.0)
```

- Function inside where block
```haskell
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2
```

# Lambdas
> Def: Anonymous function that we use when we need a function only once. Normally, we make a lambda with the sole purpose of passing it to a higher-order function
> `\ param1 param2 -> functionBody`

```haskell
-- These two are equivalent
map (+3) [1, 2, 3]
map (\x -> x + 3) [1, 2, 3]
```

# List

Is *homogeneous* i.e. can only store elements of the same type
- Initialization
```haskell
let emptyList = []

let nums = [1, 2, 3]

-- All list of lists must contain only lists of the same types
let numLists = [[1, 2], [3, 4]]
```

- Access by index
```haskell
"Hello" !! 4 -- 'o'

let myList = [1, 2]
myList !! 0 -- 1
myList !! 0 -- 1
```

- Get length
```haskell
length [1, 2, 3] -- 3
```

- Concatenation using `++` operator. `++` always takes two lists as args
```haskell
[1, 2] ++ [3, 4] -- [1, 2, 3, 4]
"hello" ++ " " ++ "world" -- "hello world"
['w','o'] ++ ['o','t'] -- "woot" (since string = list of characters)
```

- Append to the front
```haskell
5:[1,2] -- [5, 1, 2]
1:2:3:[] -- [1, 2, 3]
'A':" small cat" -- "A small cat"
```

- Compare
```haskell
-- None-empty list is always greater than an empty one
[3] > [] -- True

-- Lists are compared in lexicographical order
[3, 2, 1] > [3, 0] -- True
[3, 4, 2] == [3, 4, 2] -- True
```

- Common list operations
```haskell
head [4, 3, 2] -- 4
tail [4, 3, 2] -- [3, 2] i.e. everything but the first elem
last [4, 3, 2] -- 2
init [4, 3, 2] -- [4, 3] i.e. everything except its last elem

null [1, 2, 3] -- False
null [] -- True

reverse [1, 2] -- [2, 1]

take 2 [1, 2, 3, 4, 5] -- [1, 2]
take 3 [1, 2] -- [1, 2] i.e. if we take more elems than there are in the list -> returns the entire list

drop 2 [1, 2, 3, 4, 5] -- [3, 4, 5] i.e. drop (at most) n number of elems from the beginning of a list

maximum [1, 2, 3] -- 3
minimum [1, 2, 3] -- 1

sum [1, 2, 3] -- 6
product [1, 2, 3, 4] -- 24

-- Check if an elem is in a list
4 `elem` [3, 4, 5] -- True
10 `elem` [3, 4, 5] -- False
```

- Range
```haskell
-- Template: [start..end]
[1..5] -- [1, 2, 3, 4, 5]
['a'..'z'] -- "abcdefghijklmnopqrstuvwxyz"

-- Range with step
-- Template: [first elem,second elem..end]
[1,3..10] -- [1,3,5,7,9]
```

- Infinite list
```haskell
-- Provide no `end` for a range
[13, 26, ..] -- [13, 26, 39, ...]

-- `cycle` takes a list and replicates its elems indefinitely to form an infinite list
take 10 (cycle [1, 2, 3])

-- `repeat` takes an elem and produces an infinite list of just that elem
take 10 (repeat 5)
```

- List of the same elem
```haskell
-- replicate n x produce a list of n x
replicate 3 10 -- [10, 10, 10]
```

- List comprehension
> [\<output of the list comprehension> | \<draw elems from a list>, \<predicate 1>, \<predicate 2>]
```haskell
-- Filtering
[x * 2 | x <- [1..10], x * 2 >= 12] -- [12,14,16,18,20]

-- Use if/else
[if x < 10 then "Boom" else "Bang" | x <- nums, odd x]

-- Draw values from several lists
[x + y | x <- [1, 2, 3], y <- [4, 5, 6]]

-- Use _ as a temp variable since we don't actually care about the values
sum [1 | _ <- nums] -- Implementation of length function

-- Use list comprehension on string
removeLowercase :: [Char] -> [Char]
removeLowercase str = [c | c <- str, c `elem` ['A'..'Z']]
```

# Tuples
Is *heterogeneous* &rightarrow; can store elems of different types

Is fixed size &rightarrow; you need to know how many elems you'll be storing ahead of time

```haskell
-- Use parantheses
-- Separate elems with ,
(3, 'a', "hello")
```

The length and type of elems in a tuples make up its type
```haskell
-- THESE WILL THROW ERRORS
let myList = [(1, 2), (3, 4, 6)] -- inconsistent length

let myList = [(1, 'a'), (1, 2)] -- inconsistent type
```

# Pairs
## Common functions to manipulate pairs
```haskell
-- `fst` takes a pair and returns its first component
fst ("Wow", 11) -- "Wow"

-- `snd` takes a pair and returns its first component
snd ("Wow", 11) -- 11

-- `zip` takes 2 lists and zip them together into one list of matching elems pairs
zip [1, 2] [3, 4] -- [(1,3),(2,4)]
```

[(a, b, c) | c <- [1..10], a <- [1..c], b <- [1..a], a + b + c == 24, a^2 + b^2 == c^2]

# High-order functions
> Def: Functions that take functions as param and/or return functions as return values

### Curried functions 
> Def: A function that always takes exactly one parameter. Then when it's called with that parameter, it returns a function that takes the next parameter, and so on. 
> - Allow creation of a *partially applied function* &rightarrow; easy to create functions on the fly to pass to other functionS

`->` symbol means it's a function that takes whatever is on the *left* side of the arrow and returns a value whose type is indicated on the *right* side of the arrow.
```haskell
-- a function that takes a value of type `a`
-- and returns a function that also takes a value of type `a` and returns a value of type `a`
max :: (Ord a) => a -> (a -> a)

-- Example of partially applied function
multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

multTwoNumsWithNine :: Int -> Int -> Int
multTwoNumsWithNine = multThree 9
multTwoNumsWithNine 2 3 -- 54
```

- `map()`
```haskell
-- map :: (a -> b) -> [a] -> [b]
map (+3) [1,5,3,1,6] -- [4,8,6,4,9]
map (++ "!") ["BIFF", "BANG", "POW"] -- ["BIFF!","BANG!","POW!"]
```

- `filter()`
```haskell
-- filter :: (a -> Bool) -> [a] -> [a]
filter (>3) [1,5,3,2,1,6,4,3,2,1] -- [5,6,4]
```

- `foldl()` and `foldr()`
NOTE: `foldr` works on infinite lists, `foldl` does not
```haskell
-- foldl immediately invokes `f` on the first list item `x` and the base value `v`
-- The result will be the new base value to `foldl`
-- (((0 + 1) + 2) + 3)
foldl (+) 0 [1, 2, 3] -- 6

-- foldr invokes `f` on the first list item `x` and the recursive case
-- Once, `foldr` is recursively called enough times to exhaust the list, the base case is returned
-- (1 + (2 + (3 + 0)))
foldr (+) 0 [1, 2, 3] -- 6
```

# Patterns in functional programming
- Start with a certain set of candidate solutions, and successively apply transormations and filters to them until you've narrowed the possibilities down to the one/several solutions