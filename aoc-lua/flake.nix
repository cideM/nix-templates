{
  description = "Advent of Code in Lua";

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
            alejandra
            coreutils
            moreutils
            jq
            alejandra
            lua5_4
            stylua
            lua-language-server
            tokei
			nodePackages.prettier
          ];
        };
      }
    );
}
