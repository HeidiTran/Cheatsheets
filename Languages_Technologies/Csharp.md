# C#
- .NET in the browser [Try .NET](https://try.dot.net/)
  
### Comment
- Inline
```csharp
// An inline comment
```
- Multi-line
```csharp
/* A
 multi-line comment
*/
```

### Doc string
```csharp
/// <summary>This method changes the point's location by
///    the given x- and y-offsets.
/// <example>For example:
/// <code>
///    Point p = new Point(3,5);
///    p.Translate(-1,3);
/// </code>
/// results in <c>p</c>'s having the value (2,8).
/// </example>
/// </summary>
```

### Print
- With new line
```csharp
Console.WriteLine(str)
```

- Without new line
```csharp
Console.Write(str)
```

- String interpolation 
`{<interpolationExpression>[,<alignment>][:<formatString>]}`
```csharp
// Prepend " with $
Console.Write($"A number: {number}");

// With alignment
Console.WriteLine($"{Math.PI,20}"); //     3.14159265358979

// With alignment
Console.WriteLine($"{Math.PI,20}"); //     3.14159265358979

// With string format
Console.WriteLine($"{Math.PI:F3}"); // 3.142
```

- Preserve (Escape) `\` for Windows path
```csharp
// Prepend " with @
string path = @"folder\subfolder\file.txt";
```

### Import packages
```csharp
using <library name>
using System;
using System.Collections.Generic;
using System.IO;
```

### Get input from console
```csharp
int x = Console.ReadLine();
```

### Variables
- Declaration
```csharp
int x = -1;
char c = 'a';
string str = "a string";    // MUST be double quotes
float x = 2.3;
double y = 2.4;

// Constant
const string PascalCasing = "Pascal Casing";
```

- Get variable's type
```csharp
varName.GetType();
```

- Cast
```csharp
Dog dog = new Dog();
Animal a = dog as Animal;
```

- Enum
```csharp
// 1st way
enum Level { BIG, SMALL, MEDIUM }
Level level = Level.BIG;

// 2nd way
enum Level { 
    BIG = 2,
    SMALL = 0,
    MEDIUM = 1
}
(int) Level.BIG // return 2
(Level) 1       // return Level.MEDIUM
```

### Bool data type
```csharp
bool t = true;
bool f = false;
```

- Logical operator
```csharp
> >= < <=
== != !
```

### Numeric data type
- Cast (Convert) string to number
```csharp
int a = Convert.ToInt32(str);
long b = Convert.ToInt64(str);
```

- Max/Min Int
```csharp
int x = int.MIN_VALUE;
int y = int.MAX_VALUE;
```

### Common Math operations
- Min/Max
```csharp
Math.Min(x, y);
Math.Max(x, y);
```

- Absolute
```csharp
Math.Abs(x);
```

- Get a random number
```csharp
// Generate a random num in [start, end]
var rand = new Random();
rand.Next(start, end);  
```

### Char data type
```csharp
// Is Unicode letter
Char.IsLetter(c);

// Is digit
Char.IsDigit(c);

// Is Uppercase/Lowercase
Char.IsUpper(c);
Char.IsLower(c);
```

### String data type
- Declare
```csharp
string s = string.Empty;
string s = "abc";
string s = new string(char, count);
```

- Length
```csharp
int len = s.Length;
```

- Concatenate. *If concatenate often, use `StringBuilder`*
```csharp
str1 += str2;
```

- Compare
```csharp
str1 == str2
```

- Contain
```csharp
s.Contains(searchStr)
```

- Join
```csharp
// Default sepStr is ""
string.Join(sepStr, collection);
```

- Split
```csharp
string[] values = s.Split(sepChar)
string[] values = s.Split(sepChar1, sepChar2, ...)
```

- Sub String
```csharp
s.Substring(startIndex, length);
```

- Trim
```csharp
// Remove all starting, trailing whitespaces
s.Trim();
s.TrimStart();
s.TrimEnd();

// Remove all starting, trailing character
s.Trim(c);
s.Trim(new char[] {c1, c2});
```

- Uppercase/Lowercase
```csharp
s.ToUpper();
s.ToLower();
```

- Sort letters ascending
```csharp
string.Concat(s.OrderBy(c => c))
```

### Implicitly typed local variable `var`
- Why: Help reduce verbosity without decrease execution-time performance *since type is infered at compile-time*. Typically used in `LINQ` query
- Constraints
  - Variable with `var` MUST be initialized at point of declaration (eg: `var x;` is invalid)
  - The expr used to initalize the variable MUST have a type (eg: `var x = null;` is invalid)
  - `var` can only used for local variables, NOT fields
- When?
  - Type can't be named because it's anonymous [Anonymouse types](#anonymous-types-with-var)
  - Type's name is long, but can easily inferred
  - Precise type isn't important, and readers can easily infer the type based on the expression

```csharp
// normal
Dictionary<string, List<string>> map = new Dictionary<string, List<string>>();

// more concise. Type name is long but can easily inferred
// Note that `map` is still statically type
var map = new Dictionary<string, List<string>>();
```

### Anonymous types with `var`
Encapsulate a set of read-only properties into a single object without having to explicitly define a type. 
```csharp
var v = new { Amount = 108, Message = "Hello" };

v.Amount    // return 108
v.Message   // return "Hello
```

Typically used in `LINQ` `select` clause
```csharp
// products contain multiple fields: color, price, name, etc.
var productQuery =
    from prod in products
    select new { prod.Color, prod.Price };  // anonymous type here!

foreach (var v in productQuery) {
    Console.WriteLine("Color={0}, Price={1}", v.Color, v.Price);
}
```

- Update properties
```csharp
var apple = new { Origin = "Mexico", Price = 2.3 };
var onSale = apple with { Price = 2 };
```

### If - else if - else
```csharp
if (expr) {}
else if (expr)
else {}
```

- Ternary Operator
```csharp
return (expr) ? A : B;
```
- Null-coalescing operator `??`
    - `a??b` means that if `a` does not evaluate to `null`, return `a`, else return `b`
```csharp
T v = <val if v != null> ?? <val if v = null>;
```

- Switch
```csharp
// 1st way
switch (pattern) {
    case A:
        break;
    case B:
        break;
    default:
        return;
}

// 2nd way
T v = pattern switch {
    A => val1,
    B => val2,
    _ => defaultVal
};
```

### Loop
```csharp
// while
while (expr) { ... }

// for 
for (int i = 0; i < length; i++) { ... }

// for each
foreach (var item in collection) { ... }
```

### Functions
- Declaration
    - Function name follows **P**ascal**C**asing
```csharp
<access modifier> T FunctionName(<param 1>, <param 2>) { ... }

// Access modifiers: public, private, protected, internal, protected internal, private protected

// return type: void, <other data types>
```

- Increment, Decrement
```csharp
i++;
i--;
```

- Default (Optional) params
    - **MUST appear after non-default params**
    - A function can have many default params
```csharp
public void MyFun(int x, int y = 2) {}
```

- Variable arguments (Varargs)
Allow variable number of arguments of the same type
    - **MUST appear last in the list of params**
    - A function can have only one varargs
    - When calling: can pass no arg, can pass in an array, can pass in a `,` separated list
```csharp
// Use params keyword
T FunctionName(params <data type>[] <param name>)

// Example
int Add(params int[] nums) {
    int sum = 0;
    foreach (int num in nums) {
        sum += num;
    }
    return sum;
}
Add()               // return 0
int[] a = {1, 5};
Add(a)              // return 6
Add(1, 5)           // return 6
```

- Main
```csharp
public static void Main(string[] args) {}
```

- Lambda
```csharp
functionName = (input-parameters) => expression

functionName = (input-parameters) => { <sequence-of-statements> }

// Example
Func<int, int, int> mult = (x, y) => x * y;
Console.WriteLine(mult(5, 6));  // 30
```

- Function that returns a function
```csharp
// TODO
```

### Error Handling
- Catch all
```csharp
try {
    // sth dangerous
} catch (Exception ex) {
    // handle
} finally {
    // sth here
}
```
- Catch specific exception
```csharp
try {
    // sth dangerous
} catch (FileNotFoundException ex) {
    Console.WriteLine(ex.Message);
    Console.WriteLine(ex.StackTrace);
}
```

- Throw error 
```csharp
void takeRisk() {
    throw new NotImplementedException();
}
```

### Dynamic Array (List)
Always preferred using **List<T>** over **ArrayList** due to the overhead casting of ArrayList. [More explanation here](https://stackoverflow.com/questions/2309694/arraylist-vs-list-in-c-sharp)

- Declare
```csharp
// Replace T with a type of your choice
import System.Collections.Generic;
List<T> l = new List<T>();
List<T> l = new();  // In C# 7

// Using collection initializer
List<int> nums = new List<int>() { 1, 2, 3 };

// Create a list of 100 zeros
List<int> nums = Enumerable.Repeat(0, 100).ToList() 
```

- Length
```csharp
l.Count
```

- Is empty?
```csharp
l.Count == 0
```

- Append
```csharp
l.Add(elem)
```

- Prepend
```csharp
l.Insert(index, elem)
```

- Access (Get)
```csharp
l[index]
```

- Update
```csharp
l[i] = newVal;
```

- Sort
```csharp
l.Sort()    // return void!
```

- Contain
```csharp
l.Contains(elem)
```

- Reverse
```csharp
l.Reverse();    // return void!
```

- Remove
```csharp
// By index
l.RemoveAt(index)   // return void

// By value
l.Remove(val)       // return whether val was found (bool)

// Last elem
l.RemoveAt(l.Count - 1)
```

- Find
```csharp
// Return first found index or -1 if not found
int i = l.IndexOf(elem);
```

- Shallow copy
```csharp
List<T> copiedL = new List<T>(l);
```

- Filter
```csharp
using System.Linq;
l.Where(<predicate>).ToList();

// Example
l.Where(e => e > 2).ToList();
```

- Map
```csharp
using System.Linq;
l.Select(e => { ... });

// Example
List<T> newL = l.Select(e => e.ToUpper());
```

- Exist at least one?
```csharp
l.Exists(<predicate>);

// Example
bool b = l.Exists(e => e.EndsWith("tion"));
```

- All satisfy a predicate?
```csharp
l.TrueForAll(<predicate>)

// Example
bool b = l.TrueForAll(e => e.EndsWith("tion"));
```

### Static (Fixed size) array
- Declare
```csharp
T[] arr = new T[<max size>];

// with initialization
T[] arr = { val1, val2 };
T[] arr = new T[] { val1, val2 };
T[] arr;
arr = new[] { val1, val2 };
```

- Size
```csharp
arr.Length
```

- Sort
```csharp
Array.Sort(arr);
```

- To list
```csharp
List<T> l = new List<T>(arr);
```

- 2D array
```csharp
int[,] arr = new int[<outer size>, <inner size>];

// with initialization
int[,] arr = new[,] { { val1, val2 }, { val3, val4 } }
```

### Dictionary
- Declare
```csharp
Dictionary<TKey, TVal> d = new Dictionary<TKey, TVal>();
Dictionary<TKey, TVal> d = new();   // In C# 7

// Initialize with collection initializer
Dictionary<TKey, TVal> d = new Dictionary<TKey, TVal>
{
   { key1, value1 }, 
   { key2, value2 } 
};
```

- Length
```csharp
d.Count
```

- Add
```csharp
d.Add(key, val)
d[key] = val
```

- Get
```csharp
d[key]

// Return bool whether key in dict + retrieve d[key]
d.TryGetValue(key, out T val)
```

- Contain
```csharp
d.ContainsKey(key)
d.ContainsValue(val)
```

- Iterate
```csharp
foreach(KeyValuePair<TKey, TVal> kv in d)
{
    // d.Key
    // d.Value
}
```

- Remove
```csharp
d.Remove(key)
```

- Get all keys/values
```csharp
d.Keys
d.Values
```

- Sort by value
```csharp
using System.Linq;

// 1st way
var sortedD = from entry in d orderby entry.Value ascending select entry;

// 2nd way
var l = d.ToList();
l.Sort((pair1,pair2) => pair1.Value.CompareTo(pair2.Value));
```

### Ordered Dictionary
Has all `Dictionary` operations
- Declare
```csharp
using System.Collections.Specialized;

OrderedDictionary myOrderedDictionary = new OrderedDictionary();
```

- Remove At
```csharp
d.RemoveAt(index);
```

### Hash Set
- Declare
```csharp
HashSet<T> set = new HashSet<T>;
```

- Length
```csharp
set.Count
```

- Add
```csharp
set.Add(elem)
```

- Contain
```csharp
set.Contains(elem)
```

- Remove
```csharp
set.Remove(elem)
```

### Tuple
#### Before C# 7
Use `Tuple` class. Only allow 1 - 7 elems.
- Declare
```csharp
// Allow mixture of types
var t = new Tuple<T1, T2, T3>(val1, val2, val3);
var T = Tuple.Create(val1, val2, val3);

// Example
var T = Tuple.Create(3, (string) null, 2.3);

t.Item1     // val1
t.Item2     // val2
t.Item3     // val3
```

#### From C# 7 and later
Allow unlimited elems.
- Declare
```csharp
var t = (1, 1.2, "string", 'a');
(int, double, string, char) t = (1, 1.2, "string", 'a');
t.Item1
t.Item4

// Name the elem
(string Name, int Age) a = ("alice", 20);
a.Name
a.Age
```

- Unpack (Deconstruct)
```csharp
var t = ("alice", 20);
(string name, int age) = t;
```

### Queue/Stack
- Declare
```csharp
Queue<T> queue = new Queue<T>();
Queue<T> queue = new Queue<T>(myList);

Stack<T> stack = new Stack<T>();
Stack<T> stack = new Stack<T>(myList);
```

- Length
```csharp
queue.Count

stack.Count
```

- Add
```csharp
queue.Enqueue(elem)

stack.Push(elem)
```

- Remove 
```csharp
queue.Dequeue() // FIFO

stack.Pop()     // LIFO
```

### File Handling
- Read
```csharp
using (StreamReader reader = new StreamReader(<file path>)) {
    while (!reader.EndOfStream) {
        string line = reader.ReadLine();
    }
}
```

- Create file path
```csharp
string path = "folder" + Path.DirectorySeparatorChar + "file.txt";
```

- List files in dir
```csharp
string[] files = Directory.GetFiles(Directory.GetCurrentDirectory());
```

### Serialization
- JSON
```csharp
using System.Text.Json;

// Serialize
// JsonSerializer only serializes public props (NOT fields)
string jsonStr = JsonSerializer.Serialize(obj);

// Deserialize
// Requires a parameterless constructor 
// If an obj has a private setter -> it won't be able to set the data
// --> Use a converter
T obj = JsonSerializer.Deserialize<T>(jsonStr);
```

### Class
```csharp
class ParentClass {
    private string camelCase = "Hello";     // field
    public string PascalCase { get; set; }  // property
    
    // only method with `virtual` modifier can be overridden in the children classes
    virtual methodFromParent() {};
}

class ClassName : ParentClass {
    base(a, b); // `base` is equivalent to `super` in Java
    
    override methodFromParent() {};
    static staticMethod() {};
    nonStaticMethod() {};
}
```

- Object initializer: create a new obj and assign values to accessible fields/properties no constructor needed
```csharp
public class Cat {
    public int Age { get; set; }
    public string Name { get; set; }

    public Cat(string Name) {   
        this.Name = name;
    }
}

// without obj initializer
Cat cat = new Cat();
cat.Age = 10;
cat.Name = "Fluffly";

// with obj inializer
Cat cat = new Cat { Age = 10, Name = "Fluffy" }

// Object initializer + Constructor
Cat sameCat = new Cat("Fluffly") { Age = 10 };

// Collection initializer + obj initializer
var cats = new List<Cat>() {
    new Cat { Age = 10, Name = "Fluffy" },
    new Cat { Age = 2, Name = "Orange" }
}
```

### Properties
- Declare
```csharp
// normal
private string name;
public string Name
{
    get { return name; }
    set { name = value; }   // value is a keyword
}

// better using Automatically implemented properties
public string Name { get; set; }
public string Name { get; private set; }
```

- Declare using expression body definitions
  - Use whenever the logic for a property consists of a single expression
```csharp
public class Person
{
   private string _firstName;
   private string _lastName;

   public string Name => $"{_firstName} {_lastName}";
}
```

### Interface
- Declare
```csharp
interface AnInterface {}
public class ClassName : AnIterface {}
```

- Compare To
```csharp
class Duck : IComparable<Duck> {
   public int CompareTo(Duck otherDuck) {
       if (...) return -1;      // smaller
       else if (...) return 1;  // larger
       else return 0;           // equal
   }
}
ducks.Sort();
```

- Compare
```csharp
class DuckComparator : IComparer<Duck> {
   public int Compare(Duck d1, Duck d2) {
       if (...) return -1;      // smaller
       else if (...) return 1;  // larger
       else return 0;           // equal
   }
}

List<Duck> ducks = new List<Duck>();
ducks.Sort(new DuckComparer());
```

### Generics
- Get type of `T`
```csharp
static void PrintType<T>() {
    Console.WriteLine(typeof(T));              
}

PrintType<string>   // System.String
PrintType<int>      // System.Int32
```

### `IEnumarable` vs. `IEnumerator`
- `IEnumarable`  is a sequence that can be iterated over. `IEnumarator` is a cursor within a sequence
  - There can be many `IEnumarator` iterating over an `IEnumarable` instance without changing the state of the `IEnumarable` 

```csharp
// Enumerable = sequence
IEnumerable<int> enumerable = CreateSimpleIterator();

// Enumerator = cursor in that sequence
using (IEnumerator<int> enumerator = enumerable.GetEnumerator()) {
    while (enumerator.MoveNext()) {
        int value = enumerator.Current;
        Console.WriteLine(value);
    }
}
```
Note: Use `using` when using `IEnumerator<T>` so the iterator can be disposed properly. *When you use `MoveNext()` on an enumerator and didn't iterate all the way until the end, this could lead to resource leaking or delay resource clean up.*

### `yield`
- Key idea: lazy evaluation
  - eg: Use `yield` to create an infinite sequence
  - eg: Use `yield` to pause code execution and resume to where it left off

- Example of infinite sequence
```csharp
IEnumerable<int> Fibonacci() {
    int current = 1, next = 1;

    while (true) {
        yield return current;
        next = current + (current = next);
    }
}

// 1,1,2,3,5,
foreach (var i in Fibonacci().Take(5)) {
    Console.Write(i);
    Console.Write(",");
}
```

## Tips
- If a class implements `IEnumerable`, then it's a collection