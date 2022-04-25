+++
title = "🦀 Rust notes"
date = 2022-01-01
updated = 2022-04-22
draft = false
+++

# ch 1: getting started 
`Cargo.toml`: manifest file for Rust. 
- metadata and dependencies
`src/main.rs` where you write code.

`cargo new`: generates a hello world program
`cargo run`: run the program

## adding dependencies
you find libraries on crates.io, and packages are referred to as crates
`cargo-build` to install the dependency.
- running this creates `Cargo.lock`, which is a log of the exact versions of dependencies we are using locally.

## hello world
- indent with four spaces, not tab
- `println!` is a macro; `!` means you're calling a macro.

## hello cargo
Cargo.toml
`[package]`: indicates following statements are configuring a package.
- Cargo expects source files to live inside `src`.
- `cargo build`: builds executable in `target/debug`
- `cargo run`: builds and runs executable
- `cargo check`: check code compiles, but doesn't build executable.
- `cargo build --release`: your project is ready for release, creates executable in `target/relesae` and is compiled with optimizations

# ch 2: programming a guessing game
`::` indicates the function is an associated function for that type.
`&mut var` vs. `&var` to make it mutable.

# ch 3: common programming concepts
## 3.1: variables and mutability
- by default, variables are immutable.
- add `mut` to make it mutable.
- `const` are immutable always.
- shadowing: 
```rust
let x = 5; // x is 5 here
let x = x + 1; // x is 6 here
{
    let x = x * 2; // x is 12 here
}
// x is 6 here
```
- with shadowing we can perform a few transformations on a value but have the variable be immutable after those transformations have been completed.
- another difference between `mut` and shadowing is that by using `let`, we are creating a new variable; we can change the type of the value and reuse the same name.

## 3.2: data types
### scalar types
- single value: integers, floating-point numbers, Booleans, characters

#### integer types
- to prevent integer overflow
  - wrap all modes with `wrapping_*` methods.
  - return `None` is there is overflow with `checked_*` methods.
  - return value and boolean indicating whether there was overflow with `overflowing_*` methods.
  - saturate at the value's min or max values with `saturating_*` methods.

#### floating-point types
#### boolean type
- one byte
#### character type
- 4 bytes in size

### compound types
### tuple type
- fixed length
- once declared, cannot grow or shrink in size
```rust
let tup = (i32, f64, u8) = (500, 6.4, 1);
let (x, y, z) = tup;
let one = x.2;
```
- to get individual values, we use pattern matching or period and index.
- tuple without any value, `()` is special type that has one vane, also written `()`. the type is called *unit type* and the value is called *unit value*.
  - expressions implicitly return unit value if they don't return any other value

### arrays
- fixed length
- allocated on stack 
```rust
let a: [i32; 5] = [1, 2, 3, 4, 5];
let a = [3; 5]; // a = [3, 3, 3, 3, 3];
```
## 3.2: functions
- statements: instructions that perform some action and do not return a value
- expressions: evaluate to resulting value
- function definitions are statements
```rust
fn main() {
    let x = (let y = 6); // this does not work
}
```
- the `let` statement does not return a value, so x has nothing to bind to.
- expressions include:
  - function calls, macro calls, `{}`
- adding `;` to the end of an expression turns it into a statement.

### funcs with return values
- don't name return values, but declare type after an arrow
```rust
fn five() -> i32 {
    5
}

fn main() {
    let x = five();
}
```
- if we add a semicolon at the end of the return, we get an error.

## 3.4 control flow
- using loops; you can give loop labels.
- `break` and `continue` apply to the innermost loop at that point.
```rust
'outer_loop: loop {
  loop {
    // something happens
    break;
    //something happens
    break 'counting_up;
  }
}
```
- returning values from loops
```rust
let result = loop {
  // something happens
  break 10;
}
```
### looping through a collection with for
- we could use a `while` loop;
```rust
    while index < 5 {
        println!("the value is: {}", a[index]);

        index += 1;
    }
```
- but this approach is error prone; program could panic if index or test condition is wrong.
- also slow; compiler adds runtime code to perform the conditional check of whether the index is within the bounds of the array on every iter through the loop.
- more concise is to use `for` loop:
```rust
for element in a {
  // do something
}
```
- increased safety of code.
```rust
fn main() {
    for number in (1..4).rev() {
        println!("{}!", number);
    }
    println!("LIFTOFF!!!");
}
```

# ch 4: understanding ownership
- enables Rust to make memory safety guarantees without needing a garbage collector.

## 4.1: what is ownership
- rust manages memory through a system of ownership with a set of rules that compiler checks at compile time.
- ownership features do not slow down program whiles it's running.

### ownership rules
- each value has a variable that's called it's owner
- there can only be one owner at a time
- when owner goes out of scope, value will be dropped

### memory and allocation:

#### move
- `String::from`, requests memory it needs
- when a variable goes out of scope, Rust called `drop`, is where author of `String` can put the code to return the memory.
- to ensure memory safety: after `let s2 = s1`, Rust considers `s1` to no longer be valid; no need to free anything when `s1` goes out of scope.
```rust
    let s1 = String::from("hello");
    let s2 = s1;

    println!("{}, world!", s1);
```
- move: shallow copy and invalidates the first variable.
- Rust never automatically creates deep copies; any automatic copies are assumed to be inexpensive.

#### clone
- deeply copy the heap data, not just stack data
- expensive

#### copy
- types that have known size at compile time are stored entirely on the stack, so copies of actual type are quick to make.
- there's no reason we would want to prevent `x` from being valid after creating `y`.
```rust
    let x = 5;
    let y = x;

    println!("x = {}, y = {}", x, y);
```
- no difference between deep and shallow copy here.
- Rust has special annotation called `Copy` trait that is placed on types like integers.
- Rust won't let us annotate a type with `Copy` trait if the type or any parts of it has implemented `Drop` trait.

### ownership and functions
- passing a `String`, s, to a function means that s is no longer valid, the function _owns_ s.
- returning values can also transfer ownership.
- ownership of a variable follows the same pattern: assigning a value to another variable moves it. 
- when a variable that includes data on the heap goes out of scope, the value will be cleaned up by `drop` unless the data has been moved to be owned by another variable.
- taking ownership and then returning ownership with every function is a bit tedious.
  - what if we want to let a function use a value but not take ownership?
- anything we pass in also needs to be passed back if we want to use it again.
```rust
fn main() {
    let s1 = String::from("hello");

    let (s2, len) = calculate_length(s1);

    println!("The length of '{}' is {}.", s2, len);
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String

    (s, length)
}
```
- we can return multiple values in a tuple, and we need to return the string so we can use it again later.
-  we solve that issue by using _references_

## 4.2 references and borrowing
- add `&` to denote _references_, allow you to refer to some value without taking ownership of it.
  - called borrowing: we cannot modify a borrowed value; _references_ are also immutable.

### mutable references
1. change the variable to be `mut`: `let mut s = String::from("hello")`
2. create a mutable reference with `&mut s` and call the `change` function: `change(&mut s)`
3. update the function signature to accept mutable reference, `some_string: &mut String`

- but you can only have one mutable reference to a particular piece of data at a time.
- allows for mutation in a controlled fashion.
- this prevents data races at compile time

a _data race_ is similar to a race condition and occurs when:
1. two or more pointers access the same data at the same time
2. at least one of the pointers is being used to write to the data
3. there's no mechanism being used to synchronize access to the data

Rust won't even compile code with data races!
- we can use curly braces to create a new scope.
 
# 5: Using Structs to Structure Related Data

## 5.1 Defining and Instantiating Structs
- more flexible than tuples.
- use the init shorthand to above being repetitive.


### Creating Instances From Other Instances With Struct Update Syntax
- `..` specifies that the remaining fields not explicitly set should have the same value as the fields in the given instance.
  - must come last

If we did:
```rust
let user2 = User {
  email: String::from("yeet@dab.com"),
  ..user1
  }
```
- this means user1 is not longer usable
  - but if there are traits that use the `Copy` trait, then user1 is still valid

### Unit-Like Structs Without Any Fields
- useful when you need to implement a trait on some type bot don'th ave any data that you want to store in the type itself

# 5.2: Method Syntax
- first parameter is always self in the form `self`, `&self`, `&mut self`
- to define function within context of a Struct, start with an `impl` block.

### Associated functions
- don't have `self`, so aren't methods because they don't need an instance of the type to work with.

```
impl Rectangle {
    fn square(size: u32) -> Rectangle {
        Rectangle {
            width: size,
            height: size,
        }
    }
}

let sq = Rectangle::square(3);
```

- you can have multiple `impl` blocks

# 6. Enums and Pattern Matching
- enums allow you to define a type by enumerating it's possible variants. 

## 6.1. Defining an Enum

IP addresses are either V4 or V6, but not both. 
```rust
enum IpAddrKind {
  V4,
  V6
}
```

- create instances of enum:
```rust
let four = IpAddrKind::V4;
let six = IpAddrKind::V6;
```
`four` and `six` have the same type.

- to represent data, might put a enum in a struct. but can put data directly into each enum variant.
```rust
enum IpAddrKind {
  V4(String),
  V6(String)
}

let four = IpAddrKind::V4(String::from("111"));
```

another advantage to using enums rather than a struct is that each variant can have different types and amounts of associated data. 

### The `Option`
```rust
enum Option<T> {
    None,
    Some(T),
}
```
you have to convert `Option<T>` to a `T` before you can perform `T` operations with it.

## 6.2 the `match` Control Flow Construct
- match arms can bind to parts of the values that match the pattern; this is how values are extracted out of enum variants.
- matches are exhaustive
- `catch` catches everything else
- `_` catches any value and does not bind to that value
  - `_ => ()`: do nothing

## 6.3. Concise Control Flow with `if let`
- handle values that match one pattern while ignoring the rest
- lose exhaustive checking that `match` enforces
- can use `else` to make exhaustive

# 7. Managing Growing Projects with Packages, Crates and Modules
the module system:
- packages: cargo feature that lets you build, test, and share crates
- crates: tree of modules that produces a library or executable
- modules and use: let you control the org, scope, and privacy of paths
- paths: a way of naming an item, such as a struct, function, or module

## project/crates
- crate: binary or library
   - crate root: source file that Rust compiler starts from 

- package: one or more creates that provide set of functionality; package contains a `Cargo.toml` file that describes how to build those crates
  - can contain at most one library crate

## modules
- `src/main.rs`, `src/lib.rc`: crate roots
  - contents of either of these two files form a module called `crate` at root of the crate's module structure, known as the module tree.
- `use`: brings a path into scope
- `pub`: makes items public
- `mod`: define module with 

## paths
- two forms:
  - absolute: starts from crate root by using crate name or literal `crate`
  - relative: starts from current module and uses `self`, `super`, or an identifier in the current module

- both types of paths followed by one or more identifiers separated by double colons `::`
- all items are private by default
- items in parent module can't use the private items inside child modules, but items in child modules can use the items in their ancestor modules
  - child modules can see the context in which they're defined 
  - hiding inner implementation details is the default
  - expose inner parts of child modules' code to outer ancestor modules by using the `pub` keyword to make an item public
- adding `pub` to the module makes the module public but it's contents are still private; only code in its ancestor modules can refer to it
- using `super` with relative paths is like using `..`
- adding `pub` to struct makes struct public but fields are still private
- if we make enum public then all of its variants are public

## use
- to use module without the long path names
- functions: bring in function's parent module => makes it clear the function isn't locally defined
- structs, enums, other items: specify full path name
- provide new name with `as`, like Python
- reexporting: combine `pub` and `use`

# 8. Common Collections
- unlike built in arrays/tuples, these collections have their data stored on the heap, so the amount of data doesn't need to be known at compile time and data can grow and shrink as program runs.

3 common types:
- vector: store variable number of values next to each other 
- string: collection of charterers
- hash map: associate value with particular key

## vector `Vec<T>`:
- only store values of same type
- `vec!` macro which creates a new vector that holds values you give it
- dropping a vector drops it's elements
- access elements through `[]` (less safe) or `get()` (more safe)
- same rule of not being able to have mutable and immutable references applies for vectors:
```rust
let mut v = vec![1, 2, 3, 4, 5];

let first = &v[0]; // immutable borrow

v.push(6); // mutable borrow

println!("The first element is: {}", first);

```
- doesn't work because of how vectors work: vectors put values next to each other in memory
  - adding a new element onto the end might require allocating new memory and copying old elements into new space, then `first` would be pointing to deallocated memory
  
## String
- string slice `str` or `&str`
- `String`type: growable, mutable, owned, UTF-8 encoded string type
  - `String::from` and `to_string` do the same thing

```rust
let s1 = String::from("Hello, ");
let s2 = String::from("world!");
let s3 = s1 + &s2; // note s1 has been moved here and can no longer be used

```
Rust strings don't support indexing
- `String` is wrapper over `Vec<u8>`
- index into a string's bytes will not always correlate with valid Unicode scalar value
- if &"hello"[0] were valid code that returned the byte value, it would return 104, not h
- three ways to look at strings: bytes, scalar values and grapheme clusters
- indexing operations are expected to take constant time `O(1)`, but it's not possible because Rust has to walk thought the contents to determine how many valid characters there are
- can use range to create string slices, but can crash your program
- be explicit if you want `chars` or `bytes`

## Hash Maps `HashMap<K, V>`

# 9. Error Handling

# 10. Generic Types, Traits and Lifetimes

# 11. Writing Automated Tests

# 12. An I/O Project

# 13. FP Features: Iterators and Closures

# 14. Cargo and Crates.io

# 15. Smart Pointers

# 16. Fearless Concurrency

# 17. OOP Features of Rust

# 18. Patterns and Matching

# 19. Advanced Features

# 20. Final Project: Building A Multithreaded Web Server
