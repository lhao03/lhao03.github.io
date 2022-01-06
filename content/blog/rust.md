+++
title = "🦀 Rust notes"
date = 2022-01-01
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
