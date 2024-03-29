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
:load HelloWorld

# After modifying the current script, reload the script
:reload
```

### Modules
```bash
# Load functions from modules
:m + Data.List Data.Map Data.Set
```

# Print + Comment
```haskell
-- print
show variable

{-
This is a 
multi-line comment
-}
```

# Math 
> Exactly the same is typing normal math in other programming languages
> Note that math operators (`+`, `*`, `-`, `/`, etc.) are functions.
```haskell
-- Mod
24 `mod` 7 -- 3

-- Exponential
4^2 -- 16.0

-- Pi value
pi -- 3.141592653589793
```

### Common built-in Math functions
```haskell
min x y -- min(x, y)
max x y -- max(x, y)

subtract y x -- x - y
div x y -- x // y (integer division)
negate x -- x * (-1)

succ x  -- x + 1
compare x y -- returns GT/LT/EQ

-- Examples
succ 9 + max 5 4 + 1 -- 16
```

# Boolean Values + Operators
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

-- Conditional expression requires that both possible results have the same type
-- This will throw type error
if True then 1 else False
```

# Types
- Check types
```haskell
:t <expression>
:type <expression>

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
```bash
# Get type's definition
:info <type>

# Example
:info Bool
type Bool :: *
data Bool = False | True
```

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

# Type Class
> **Def:** An interface that defines some behavior. If a type is an *instance* of a type class, then it supports and implements the behavior the type class describes.
>
> **TLDR;** A type class specifies a bunch of functions and when we decide to make a type an instance of a type class, we define what those functions mean for that type.
>
> Type classes correspond to **sets of types** which have certain operations defined for them
>
> Type classes **are not the same** as classes in languages like Java, Python, C++, etc.

```haskell
-- Look at the `Eq` type class provided by the Prelude
-- Read: `Eq` is declared to be a type class
-- with a single type parameter, `a`
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool

-- Any type `a` which wants to be an instance of `Eq` must define 2 functions (==) and (/=) 
-- with the indicated type signatures
instance Eq Int where
    (==) :: Int -> Int -> Bool
    (/=) :: Int -> Int -> Bool

-- Define type class YesNo
class YesNo a where
    yesno :: a -> Bool

-- Concrete instance of a YesNo type class for Int
instance YesNo Int where
    yesno 0 = False
    yesno _ = True

-- Concrete instance of a YesNo type class for Int
instance YesNo String where
    yesno "" = False
    yesno _ = True

-- Usage
ghci> yesno 5
True
ghci> yesno ""
False    
```

`=>` is a **type class constraint** &rightarrow; Everything before the `=>` must be an instance of that class

```haskell
-- The equality function takes any two values that are of the same type and returns a `Bool`
-- The type of those 2 values must be an instance of the `Eq` class
(==) :: (Eq a) => a -> a -> Bool
```
- Common type classes
    - `Eq` supports equality testing -> It covers these functions: `==` and `\=`
    - `Ord` is a type class for types whose values can be put in some order. It covers these functions: `>`, `<`, `>=`, and `<=`
    - `Show` is a type class that converts value of different data type to strings 
    - `Read`is a type class that convert strings to value of specified data type (eg: `read "10" :: Float`)
- Some other notes
    - One type can be an instance of many type classes
        - `Char` type is an instance of `Eq` and `Ord`
    - Once type class can have many types as instances
    - Sometimes, a type must first be an instance of one type class to be allowed to become an instance of another  
        - eg: To be an instance of `Ord`, a type must first be an instance of `Eq`

> **Note:** In OOP languages, we create objs from classes. In Haskell, we don't make data from type classes. Instead, we make our data type, then think about how it can act.
> - If it can act like sth that can be equated &rightarrow; make it instance of the `Eq` type class
> - If it can be ordered &rightarrow; make it an instance of the `Ord` type class

```haskell
data Size = Small | Medium | Large deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- Eq type class
Small == Small -- True
Large > Small -- True

-- Ord type class
Medium `compare` Small -- GT

-- Show type class
show Small -- "Small"

-- Read type class
read "Medium" :: Size -- Medium

-- Bounded type class
minBound :: Size -- Small
maxBound :: Size -- Large

-- Enum type class
succ Medium -- Large
pred Medium -- Small
[Small, Small, Large] -- make a list
[Small .. Large] -- [Small, Medium, Large] (a range)
```

# Parametric polymorphism vs. Ad-hoc polymorphism
### Parametric polymorphism
- Allows a function to be used at different types, but performs *the same* operation no matter the type 
- A function that's parametrically polymorphic in `a` MUST behave the same no matter if `a` is an `Int` or a `Bool`
- The "not caring" what type `a` is is the "parametric" in **parametric polymorphism**
```haskell
-- Example of a polymorphic function
-- This function will work for ANY type `a`
-- The caller of `length` gets the pick of type
-- `length` function doesn't no anything about the type since it's been abstracted over by the type variable `a`
length :: [a] -> Int 
```
- Consequences of Parametricity
    - Type erasure: All types information can be dropped during compilation. Types are important when writing and compiling Haskell code, but they're irrelevant when running the code &rightarrow; gives Haskell + other statically typed languages speed boost since they don't need to keep types around nor check them at runtime (like Python)
    - Restricts what functions you can write
        - eg: You cannot write functions like `strange :: a -> b` since it will never returns
    - Lets you draw conclusions about a function knowing only its type
        - eg: Given function `limited :: a-> a` we know that the function must produce a value type `a` when given a value of type `a`

###  Ad-hoc polymorphism
- Allows **different** behaviors for different types (`==` on `Int` behaves differently than `==` on `String`)
- Is the kind of polymorphism seen in OO languages
- Is achieved by using type classes &rightarrow; use type class constraint to make the functions work for SOME types, but not all types

---

# Variable assignments with `let` expression
> Template: `let <bindings> in <expression>` The variables defined in `let` are visible within the entire `let` expression
>
> Pros: Are expressions + allow you to bind to variables anywhere
>
> Cons: Are local + don't span across guards
```haskell
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerOrEqual = filter (<= x) xs
        larger = filter (> x) xs
    in  quicksort smallerOrEqual ++ [x] ++ quicksort larger
```

Since `let` is an expression, you can use it in  many scenarios
```haskell
-- Introduce functions in a local scope
[let square x = x * x in (square 5, square 3)] -- [(25,9)]

-- Separated expressions by `;`
let a = 100; b = 200; c = 300 in a*b*c -- 6000000

-- Deconstruct a tuple and bind them to names (Pattern matching with `let`)
let (a, b, c) = (1, 2, 3) in a + b + c -- 6

-- Use in list comprehensions
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
```

# Functions
- Function Name

**Cannot** begin with capital letters.

Apostrophe (`'`) is a valid character to use in a function name. We usually use `'` to denote either a *strict* version of a function (i.e. one that isn't lazy) or a slightly modified version of a function or variable with a similar name.

A list usually have the suffix `s` on their names to indicate that they may contain multiple values. Eg: a list of numbers might be named `ns`, a list of arbitrary values might be named `xs`, and a list of characters might be named `css`

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

> **Note:** Function application has higher priority than other operators in the language
> eg: `f a + b` means `(f a) + b` rather than `f (a + b)`

> **Special case for functions with two args:** function can be written between its args by enclosing the name of the function in single back quotes `(``)`
>
> ``sum myList `div` length myList`` is equivalent to `div (sum myList) (length myList)`

- Throw errors
```haskell
head' :: [a] -> a
head' [] = error "Can't call head on an empty list,!"
head' (x:_) = x
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

- **Partial function**: Functions which are well-defined on only *some* possible inputs. It's good practice to avoid partial function in *any* language
```haskell
head :: [a] -> a
head (x:_) = x
head [] = error "Prelude.head: empty list"
```

# Lambdas
> **Def:** Anonymous function that we use when we need a function only once. Normally, we make a lambda with the sole purpose of passing it to a higher-order function
> `\ param1 param2 -> functionBody`

```haskell
-- These two are equivalent
map (+3) [1, 2, 3]
map (\x -> x + 3) [1, 2, 3]
```

# Function application with `$`
> **Def:** `$` is the function application operator. While function application with a space is left-associative (`f a b c` is the same as `(((f a) b) c)`), function application with `$` is right-associative (`f $ g $ x` is the same as `f $ (g $ x)`).
>
> **TLDR;** You can imagine `$` as almost being the equivalent of writing an opening parenthesis, and then writing a closing parenthesis on the far right side of the expression

```haskell
-- All of these are equivalent
sum (filter (> 10) (map (*2) [2..10]))
sum $ filter (> 10) (map (*2) [2..10])
sum $ filter (> 10) $ map (*2) [2..10]
```

In addition, `$` let you treat function application like another function &rightarrow; you can map function application over a list of function
```haskell
map ($ 3) [(4+), (10*), (^2)] -- [7.0,30.0,9.0]

-- Equiv to [(4+) $ 3, (10*) $ 3, (^2) $ 3]
```

# Function Composition with `.`
> In Math *(f . g)(x) = f(g(x))*. Similarly, in Haskell `f (g (z x))` is the same as `(f . g . z) x` since `.` is right-associative
```haskell
-- Definition
(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)
```
Examples:
```haskell
-- These two are equivalent
map (\x -> negate (abs x)) [5,-3,-6] -- [-5,-3,-6]
map (negate . abs) [5,-3,-6]

-- These three are equivalent
sum (replicate 5 (max 6.7 8.9))
(sum . replicate 5) (max 6.7 8.9)
sum . replicate 5 $ max 6.7 8.9 -- Simplified
```
Note: For functions that take several params, to use them in function composition, we usually must partially apply them so that each function takes just one param
```haskell
-- Contrive example but demonstrate the point. These two are equivalent
map (*3) $ zipWith max [1,2] [4,5]
(map (*3) . zipWith max [1,2]) [4,5]

-- Notice how function partial `zipWith max [1,2]` only takes just one more param
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

-- Check if any elem satisfy a predicate
any (> 4) [1, 2, 3] -- False
```

- Range
```haskell
-- Template: [start..end] (start >= end since ranges only go forwards)
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
[0, -1 ..] -- negative numbers

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
(3, 'a', "hello") :: (Int, Char, String)
```

The length and type of elems in a tuples make up its type
```haskell
-- THESE WILL THROW ERRORS
let myList = [(1, 2), (3, 4, 6)] -- inconsistent length

let myList = [(1, 'a'), (1, 2)] -- inconsistent type
```

Get the elems
```haskell
-- First elem
fst s

-- Second elem
snd s
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

# High-order functions
> **Def:** Functions that take functions as param and/or return functions as return values

### Curried functions 
> **Def:** A function that always takes exactly one parameter. Then when it's called with that parameter, it returns a function that takes the next parameter, and so on. 
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

- `foldl'` in `Data.List` can do what `foldl` does but instead of deferring computations that can cause stack overflow, it would evaluate computations immediately. &rightarrow; `foldl'` is better to use than `foldl` on large list of million elems

# Modules
- Import
```haskell
-- Import modules
-- Cons: Call to `filter` will make ghci confused since Data.List has its own `filter`
import Data.List

-- Import modules + rename
import qualified Data.Map as M

-- Import some functions from a module
import Data.List (nub, sort)
```

- Create
```haskell
-- File name should be MyModule.hs
-- This module can only be imported by modules in the same folder
-- (..) means export all value constructors. We could choose NOT to export any value constructors by removing (..)
module MyModule 
( exportedFunction1
, exportedFunction2
, exportedFunction3
, MyDatatype(..)
) where

-- <Define exportedFunction1, exportedFunction2, exportedFunction3 here>
-- <Define helperFunctions here if necessary >
-- <Define MyDataType here>
```

- Create hierarchical modules

Each module can have a number of submodules, which can have submodules of their own

```haskell
-- Creating `Geometry` module that has 2 submodules
-- First, make a folder called `Geometry`. We'll put two files: `Sphere.hs` and `Cube.hs`

-- Inside `Sphere.hs`
module Geometry.Sphere 
(volume
, area
) where 
-- <define functions here>

-- Inside `Cube.hs`
module Geometry.Cube
( volume
, area
) where
-- <define functions here>

-- To import submodules
import qualified Geometry.Sphere as Sphere
import qualified Geometry.Cube as Cube
```

# New Data Type 
```haskell
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
    deriving (Show) 

-- Make a Circle  
Circle 10 10 20  
```
- `data` keyword &rightarrow; new data type is being defined
- `Shape`, which is right before `=` denotes the **type constructor**
- `Circle` and `Rectangle` are **value constructors** &rightarrow; must start with an uppercase letter
    - `Circle` value constructor takes 3 params, `Rectangle` value constructor takes 4 params
    - Value constructors are functions that return a value of a data type
        - eg: `Circle :: Float -> Float -> Float -> Shape`
    - Value constructor's name can be the same as the data type's name
        - eg: `data Point = Point Float Float deriving (Show)`
    - Value constructors may take no params
      - eg: `data Maybe a = Nothing | Just a`
- `deriving (Show)` makes type `Shape` part of the `Show` type class &rightarrow; Haskell will know how to display our data type as a string

```haskell
-- Use record syntax to give value constructors' parameters names
-- It will automatically create functions that look up the fields `firstName`, `age`, `height`
-- eg: (autogen) firstName :: Person -> String   
-- eg: (autogen) age :: Person -> Int  

data Person = Person { firstName :: String
                     , age :: Int
                     , height :: Float } deriving (Show)

-- Construct a person (param's order doesn't matter)
Person {age = 20, height = 6.2, firstName = "A"}                
```

- **Recursive** Type: used to build inductive types
```haskell
data NaturalNumber = Zero | Succ NaturalNumber

nat2int :: Nat -> Integer
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

-- list data type
data List a = Nil | Cons a (List a)
```

# Type Constructors - Type Parameters
> **Type constructor** takes types as parameters to produce new types. eg: the list type takes a type parameter to produce concrete types such as `[Int]` type, `[Char]` type, or a `[[String]]` type.
>
> Type parameters are useful when the type that's contained inside the data type's constructors isn't important for the type to work. eg: a list of stuff is a list of stuff no matter what the type of stuff is, a map of key:value enables us to map from any type to any other type.

```haskell
-- Vector type constructor
data Vector a = Vector a a a deriving (Show)

-- Adding 2 vectors resulting in a new vector
vplus :: (Num a) => Vector a -> Vector a -> Vector a 
```
- The `Vector` type constructor can create many types: `Vector Int`, `Vector Float`, `Vector Double`
- `vplus` function can operate on any type of form `Vector a` as long as `a` is an instance of the `Num` type class. &rightarrow; won't work for type `Vector Char` or `Vector Bool`
- `vplus` function can only operate of vectors of the same type &rightarrow; can't add a `Vector Int` and a `Vector Double`
- We didn't put class constraint `(Num a) =>` in the type constructor declaration because even if we put it there, we would still need to repeat the constraints when declaring the functions (such as `vplus`)

```haskell
-- Example type constructor with many type parameters
data Map k v = ...
```

# Type alias
```haskell
-- PhoneNumber is an alias for type String
type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]
```

- Type can be nested
```haskell
type Pos = (Int, Int)
type Trans = Pos -> Pos -- referenced type Pos
```

- Type **CANNOT** be recursive
```haskell
type Tree = (Int, [Tree]) -- BAD!
```

# Functor Type Class
- Abstract `map` function. `map` works with list only. We want to be able to write `map` that works with other type of data structure
- Functor allows you to define a `map` function for **type constructors that takes a single param which is a type**
```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
```

```haskell
-- Maybe type constructor
data Maybe a = Nothing | Just a

-- Since Maybe is a type constructor with only one type param a
-- We can write a Functor for Maybe
instance Functor Maybe where
    -- fmap :: (a -> b) -> Maybe a -> Maybe b
    fmap f Nothing = Nothing
    fmap f (Just x) = Just (f x)
```

```haskell
-- Tree type constructor
data Tree a = Leaf a | Node (Tree a) (Tree a)

-- Since Tree is a type constructor with only one type param a
-- We can write a Functor for Tree
instance Functor Tree where
    -- fmap :: (a -> b) -> Tree a -> Tree b
    fmap f (Leaf x) = Leaf (f x)
    fmap f (Node l r) = Node (fmap f l) (fmap f r)
```

```haskell
-- Either type constructor
data Either a b = Left a | Right b

-- Since Either takes 2 type params, we can onlly write a Functor for Either
-- if we partially apply Either to the first param
instance Functor (Either a) where
    -- fmap :: (b -> c) -> (Either a) b -> (Either a) c
    fmap f (Left x) = Left x  
    fmap f (Right x) = Right (f x)

-- Note: Nothing occur for the (Left x) case since Left contains type a, but f only knows how to transform b -> c. Thus, we have to leave the value of Left unchanged
```
## Functor Laws
```haskell
-- Law 1
fmap id = id

-- Law 2
fmap (f . g) = fmap f . fmap g -- = fmap f (fmap g x)
```

```haskell
-- Proof that Maybe Functor follows the laws

-- Law 1
fmap id Nothing = Nothing
id Nothing = Nothing

fmap id (Just x) = Just (id x) = Just x
id (Just x) = Just x

-- Law 2
fmap (f . g) Nothing = Nothing
fmap f (fmap g Nothing) = fmap f Nothing = Nothing

fmap (f . g) (Just x) = Just $ (f . g) x = Just (f (g x))
fmap f (fmap g (Just x)) = fmap f (Just (g x)) = Just (f (g x))
```
---
# Applicative
- Problem with `Functor` is it only takes type constructor with **only one** type param &rightarrow; can't write `Functor` for `Either` without partial apply
- `Applicative` allows you to define a `map` function for **type constructors that takes multiple type params**

```haskell
class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

-- An Applicative takes a Functor f
-- `pure` takes an arbitrary value and turns it into a functor value i.e. wrap the value in a context box
-- `<*>` takes a functor value that wraps a function + a functor value that wraps a value
-- > "unwraps" the function in the first arg and applies it to the unwrapped second arg
```

```haskell
instance Applicative Maybe where
    pure = Just -- to turn a val into a Maybe val
    Nothing  <*> _        = Nothing
    _        <*> Nothing  = Nothing
    (Just f) <*> (Just x) = Just (f x)

-- Cleaner version
instance Applicative Maybe where
    pure = Just 
    Nothing  <*> _        = Nothing
    (Just f) <*> (Just x) = fmap f (Just x)
```
---

# Patterns in functional programming
- Start with a certain set of candidate solutions, and successively apply transormations and filters to them until you've narrowed the possibilities down to the one/several solutions