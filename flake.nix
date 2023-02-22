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
          description = "A Haskell app using the Nixpkgs Haskell infrastructure and GHC 9.2.6";
        };
        go = {
          path = ./go;
          description = "A Nix shell for Go development. Does not use buildGoPackage/buildGoModule";
        };
        node-npm = {
          path = ./node-npm;
          description = "The latest NodeJS and NPM from Nixpkgs";
        };
        node-yarn = {
          path = ./node-yarn;
          description = "The latest NodeJS and Yarn from Nixpkgs";
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
