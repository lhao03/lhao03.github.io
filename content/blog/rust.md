+++
title = "Rust notes"
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
