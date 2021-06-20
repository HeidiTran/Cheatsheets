# Classes
- Scala prefers **immutable** classes aka classes without any mutation methods. If you need to mutate an instance variable -> have a method that return a new instance of the class with the update values
```scala
/* Class declaration contains constructor
 * Use `val` if for immutable instance variables (no assignment allowed). 
 * Else, use `var` for mutable instance variables
 */
class Time(val hours: Int, val minutes: Int = 0) {
  if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) throw new IllegalArgumentException

  this() {...} // Another constructor

  def addMinutes(m: Int) = {
    ...
    new Time(newHours, newMinutes)
  }

  def before(other: Time): Boolean = hours <= other.hours && minutes < other.minutes

  override def toString: String = f"The time is ${hours}:${minutes}%02d"
}

val ago = new Time(10, 37)
val now = new Time(12)
now.before(ago)
ago.before(now)

ago.minutes // return Int 37
```

- Scala prefers define methods that take no params and have no side effect as **parameterless methods** i.e. methods without `()`
- Methods that has side-effects (eg: print to std, mutate state, destroy data) MUST be declared with `()`
```scala
//  If there's no `val` or `var` before the variables' names, it's treated as just a param
class Time(h: Int, m: Int = 0) {
  if (h < 0 || h > 23 || m < 0 || m > 59) throw new IllegalArgumentException

  private var minutesSinceMidnight = h * 60 + m

  // `hours` and `minutes` are now accessors instead of instance variables. NO ()!
  def hours: Int = minutesSinceMidnight / 60
  def minutes: Int = minutesSinceMidnight % 60

  // Mutators. Note: No space between `_` and `=`
  def hours_= (newValue: Int): Unit = {
    if (newValue < 0 || newValue > 23)
    minutesSinceMidnight = newValue * 60 + minutes
  }
  def minutes_= (newValue: Int) {
    if (newValue < 0 || newValue > 59) throw new IllegalArgumentException
    minutesSinceMidnight = hours * 60 + newValue
  }

  def before(other: Time): Boolean = minutesSinceMidnight < other.minutesSinceMidnight

  override def toString: String = f"The time is ${hours}:${minutes}%02d"
}

val ago = new Time(10, 37)
val now = new Time(12)
now.before(ago)
ago.before(now)

ago.minutes // return Int 37
ago.minutes = 29
ago.minutes // return Int 29
```

- You can invoke method with inflix notation
    -  eg: `p.to(q)` is similar to `p to q`
- Class name can contain any symbols (unlike Java) 
    - eg: `def *(x: Int) = {...}` is a valid method's name -> Invoke it by `classVar.*(2)` or `classVar * 2`

# Companion object
> "Companion object" of a class = object with the same name in the same source file
```scala
class Time {...}
object Time {...}
```
- Have access to each other's **private** features
- It's common to have the `apply` method defined in companion object for *factory methods*
```scala
object Time {
  def apply(h: Int, m: Int = 0) = new Time(h, m)
}

/* Client doesn't need to call `new` keyword
 * When no method is called -> default to calling `apply`
 */
val now = Time(10, 37) // prettier than new Time(10, 37)
```

# `object` keyword 
> Use for creating singletons and static methods
- eg: singletons
```scala
object Accounts {
  private var lastNumber = 0
  def newUniqueNumber() = {
    lastNumber +=1
    lastNumber
  }
}

val a = Accounts
a.newUniqueNumber() // Use () since the method mutates state
```

- static method
```scala
// This method is equivalent to `static main(String[] args)`
object MyApp extends App {
  println(f"Hello, ${args(0)}!")
}
```

# Inheritance
- Subclass declaration similar to Java
```scala
class Manger extends Employee
```

- Superclass construction
```scala
class Employee(name: String, age: Int, val salary: Double) extends Person(name, age)
```

# Traits
> Superficially similar to Java `interface`
- A class can extend multiple traits
```scala
class Employee extends Person with Serializable with Cloneable
```

- CANNOT have construction parameters
- Can have abstract fields (force implementing class to implement) + concrete fields (implementing class will have these)
```scala
trait Logged {
  // abstract methods
  def log(msg: String) {}
}
```
- A trait can inherit from other traits
```scala
trait ConsoleLogger extends Logged {
  override def log(msg: String): Unit = {
    println(msg)
  }
}
```

- Mixins and layered traits
```scala
// Let say we have another trait inherits from `Logged`
trait TimestampLogger extends Logged {
  override def log(msg: String) {
    super.log(new java.util.date() + " " + msg)
  }
}

// We also have a concrete class that inherit from `Logged`
class SavingsAccount extends Logged {
  private var balance: Double = 0
  def withdraw(amount: Double) {
     if (amount > balance) log("Insufficient funds")
     else balance -= amount
  }
}

// Mixins different traits
var acct1 = new SavingsAccount with ConsoleLogger
var acct2 = new SavingsAccount with ConsoleLogger with TimestampLogger

/* Traits are invoked from back to front
 * If we try `acct2.withdraw(1000)` the `log` method from TimestampLogger with be invoked first
 * Then, the `log` method from ConsoleLogger will be invoked
 */
```

# Imports
- Import can be **anywhere** -> can import locally inside classes/methods -> limit scope of import
```scala
import java.util.Date
val now = new Date  // shortcut for `new java.util.Date`

// In Scala, wildcard is `_` instead of `*`
import java.util._
import java.lang.Math._

// Import multiple classes
import java.awt.{Color, Font}

// Alias a class name
import java.util.{HashMap => JavaHashMap}
```
# High-order functions
- `collection.map(f)` applies function `f` to every element in the `collection`
```scala
// Example 1: Square all elements
val arr = Array(1, 2, 3)
arr.map(x => x * x) // can be simplified to

// Example 2: Initialize an array contains n number of x
(1 to n).map(elem => x)
```

- `collection.filter(f)` uses boolean expression `f` to filter the `collection`
```scala
// Example 1: Filter for even numbers
val arr = Array(12, 5, 16, 20, 9)
arr.filter(x => x % 2 == 0) // can be simplified to
arr.filter(_ % 2 == 0)

// Example 2: Filter for strings with length > 5
val strs = Array("hello", "cup", "apple", "berry", "orange")
str.filter(_.length > 5)
```

- `reduceLeft(f)` similar to `foldl` in Racket
```scala
// Example 1: Calculate factorial
def factorial(x: Int) = {
  (1 to x).reduceLeft(_ * _)
}

// Example 2: Join a list of strings
def concat(strings: Seq[String], separator: String) = {
  strings.reduceLeft(_ + " " + _)
}
concat(Array("Mary", "had", "a", "little", "lamb"), " ") // returns "Mary had a little lamb"

// Example 3: Min of a list
val a = Array(12, 5, 16, 20, 9)
a.reduceLeft(_ max _) // returns 20

// Example 4: Pass a user-defined function to reduceLeft to find longest string
strings.reduceLeft((x: String, y: String) => if (x.length > y.length) x else y)
```

# `groupBy` method
```scala
val words = Array("Marry", "had", "a", "little", "lamb", "its", "fleece", "was", "white", "as", "snow", "and", "everywhere", "that", "Mary", "went", "the", "lamb", "was", "sure", "to", "go")

words.groupBy(_.substring(0, 1))     // scala.collection.immutable.Map[String, Array[String]] where the key is the first letter and the Array is the array of all words begin with that letter

words.groupBy(_.length) // group by words' length
```
  
# `partition` method
```scala
val arr = ArrayBuffer(1, -3, -4, 2, 5, 10, -6)
val (negative, positive) = arr.partition(_ < 0) // partition returns a tuple
```

# Scala Project Folder Structure
```scala
// All source files is under `scala` folder 

└── src
    └── main
        └── scala
```