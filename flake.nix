{
  description = "A collection of Nix templates that I use on a regular basis.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    {
      templates = {
        unstable-utils = {
          path = ./unstable-utils;
          description = "A great basis for shell scripts. Uses the 'nixpkgs-unstable' branch and 'flake-utils'";
        };
        haskell = {
          path = ./haskell;
          description = "A Haskell app using the Nixpkgs Haskell infrastructure";
        };
        rust = {
          path = ./rust;
          description = "A Nix shell for Rust development: nixpkgs toolchain, rust-analyzer, pkg-config and openssl. Does not use buildRustPackage";
        };
        go = {
          path = ./go;
          description = "A Nix shell for Go development. Does not use buildGoPackage/buildGoModule";
        };
        node = {
          path = ./node;
          description = "The latest NodeJS and NPM from Nixpkgs";
        };
        lua = {
          path = ./lua;
          description = "Lua";
        };
        janet = {
          path = ./janet;
          description = "Janet flake with an Advent of Code README.md";
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            alejandra
            haskellPackages.cabal-fmt
          ];
        };
      }
    );
}
