{
  description = "Just GHC and some adjacent tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in rec {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            alejandra
            coreutils
            moreutils
            jq

            hlint
            haskellPackages.hoogle
            haskellPackages.fast-tags
            haskell.packages.ghc912
            ormolu
            ghciwatch
          ];
        };
      }
    );
}
