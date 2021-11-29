{
  description = "Nix Flake template using the 'nixpkgs-unstable' branch and 'flake-utils'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        project = pkgs.haskellPackages.callPackage ./project.nix {};
      in
      {
        devShell = pkgs.mkShell {
          inputsFrom = [ project.env ];
          buildInputs = with pkgs; with haskellPackages; [
            coreutils
            moreutils
            jq

            ghcid
            ormolu
            hlint
            cabal2nix
            cabal-install
            cabal-fmt
            fast-tags
            hoogle
          ];
        };
      }
    );
}
