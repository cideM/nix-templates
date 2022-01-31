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

## `haskell`

A simple Haskell starter template which uses `cabal2nix` to generate a Nix
environment for your project. The cabal file defines default language extensions!

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

## `go`

Dev shell with Go tools. Building is not handled by Nix, instead it's expected
that you just `go build main.go`

- `nixpkgs-unstable`
- `flake-utils`
- Dev shell with:
  - Shell utilities
    - `coreutils`
    - `moreutils`
    - `jq`
  - Go stuff
    - `go`
    - `gopls`
    - `gotools`
    - `graphviz`
    - `golangci-lint`
    - `go-outline`
    - `gopkgs`

