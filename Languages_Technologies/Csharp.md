# C#
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
```csharp
// Prepend " with $
Console.Write($"A number: {number}");
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

- Variable assignment if null
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
- Declare
```csharp
import System.Collections.Generic;
List<T> l = new List<T>();
List<T> l = new();  // In C# 7
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

### Static array
- Declare
```csharp
T[] arr = new T[<max size>];

T[] arr = { val1, val2 };
T[] arr = new T[<max size>] { val1, val2 };
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
```

### Dictionary
- Declare
```csharp
Dictionary<TKey, TVal> d = new Dictionary<TKey, TVal>();
Dictionary<TKey, TVal> d = new();   // In C# 7

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
Only available in C# 7 and later
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
    public string PascalCase {              // property
        get; 
        set { camelCase = value; }          // value is a keyword
    } 
    
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