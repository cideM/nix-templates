{
  description = "Janet flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=36fcc808a13782146ab0549ad52c27551af5c49f";
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
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            coreutils
            jq
            alejandra
            tokei
            janet
            jpm
          ];
        };
      }
    );
}
