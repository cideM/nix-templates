{
  description = "The latest NodeJS and NPM from Nixpkgs";

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

      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            coreutils
            moreutils
            jq

            # You can leverage Typescript even in a pure Javascript project.
            pkgs.nodePackages.typescript-language-server
            pkgs.nodejs
          ];
        };
      }
    );
}
