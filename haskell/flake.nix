{
  description = "Simple Haskell Flake";

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

        project = pkgs.haskellPackages.callPackage ./project.nix {};

      in rec {
        devShell = pkgs.mkShell {
          inputsFrom = [project.env];

          buildInputs = with pkgs;
          with haskellPackages; [
            coreutils
            moreutils
            jq

            cabal2nix

            (haskell.packages.ghc96.ghcWithPackages (hpkgs:
              with hpkgs; [
                cabal-install
                cabal-fmt
                hlint
                hoogle
                fast-tags
                ormolu
                ghcid
              ]))
          ];
        };
      }
    );
}
