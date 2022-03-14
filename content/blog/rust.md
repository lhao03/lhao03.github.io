+++
title = "🦀 Rust notes"
date = 2022-01-01
draft = false
[extra]
category = ["learning"]
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
 
