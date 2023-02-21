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

        # https://github.com/NixOS/nixpkgs/issues/209397
        # https://github.com/NixOS/nixpkgs/issues/140774#issuecomment-1371565125
        workaround140774 = haskellPackage:
          with pkgs.haskell.lib;
            overrideCabal haskellPackage (drv: {
              enableSeparateBinOutput = false;
            });
      in rec {
        devShell = pkgs.mkShell {
          inputsFrom = [project.env];

          buildInputs = with pkgs;
          with haskellPackages; [
            coreutils
            moreutils
            jq

            cabal2nix

            (haskell.packages.ghc92.ghcWithPackages (hpkgs:
              with hpkgs; [
                cabal-install
                cabal-fmt
                hlint
                hoogle
                fast-tags
                (workaround140774 ormolu)
                (workaround140774 ghcid)
              ]))
          ];
        };
      }
    );
}
