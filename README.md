# Introduction

A collection of Nix templates that I use on a regular basis.

## `unstable-utils`

A basic flake that uses the `nixpkgs-unstable` branch, so you get very
up-to-date packages. Great as a base for shell scripts.

- `nixpkgs-unstable`
- `flake-utils`
- Dev shell with:
  - `coreutils`
  - `moreutils`
  - `jq`

## `haskell-advent-of-code`

Comes with a proper Haskell project setup and a whole bunch of tools that
should make Advent of Code a bit easier. The resulting executable accepts a
positional parameter of `p1` or `p2` to determine which day to run. Pipe the
input to the executable: `$ echo "foo" | cabal v2-run pkg:haskell-advent-of-code -- p1`

Use this flake for each day and customize the dependencies.

- `nixpkgs-unstable`
- `flake-utils`
- Dev shell with:
  - Shell utilities
    - `coreutils`
    - `moreutils`
    - `jq`
  - Haskell stuff
    - `ghcid`
    - `ormolu`
    - `hlint`
    - `cabal2nix`
    - `cabal-install`
    - `cabal-fmt`
    - `fast-tags`
    - `hoogle`
