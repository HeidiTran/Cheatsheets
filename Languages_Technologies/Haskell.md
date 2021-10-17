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
div x y -- x // y (integer division)
succ x  -- x + 1

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

# Functions
- Function Name

**Cannot** begin with capital letters.

Apostrophe (`'`) is a valid character to use in a function name. We usually use `'` to denote either a *strict* version of a function (i.e. one that isn't lazy) or a slightly modified version of a function or variable with a similar name.

- Declaration
> Parameters and return type are separated by `->` with the return type always coming last in the declaration
```haskell
-- Define function hello that take 0 param
hello = "Hello World"

-- Define function doubleMe that take 1 param
doubleMe :: Int -> Int -> Int
doubleMe x = x + x

-- Define function doubleUs that take 2 params
-- equiv to doubleUs x y = doubleMe x + doubleMe y
doubleUs :: Int -> Int -> Int
doubleUs x y = x * 2 + y * 2 
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

# Patterns in functional programming
- Start with a certain set of candidate solutions, and successively apply transormations and filters to them until you've narrowed the possibilities down to the one/several solutions