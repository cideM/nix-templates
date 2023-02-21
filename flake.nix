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
          description = "Nix Flake template using the 'nixpkgs-unstable' branch and 'flake-utils'";
        };
        haskell = {
          path = ./haskell;
          description = "Simple Nix Flake for a Haskell project";
        };
        go = {
          path = ./go;
          description = "Nix Flake with the Go tools where building is not handled by Nix";
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
          ];
        };
      }
    );
}
