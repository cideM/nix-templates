{
  description = "Nix Flake template using the 'nixpkgs-unstable' branch and 'flake-utils'";

  outputs = { self }: {
    templates = {
      unstable-utils = {
        path = ./unstable-utils;
        description = "Nix Flake template using the 'nixpkgs-unstable' branch and 'flake-utils'";
      };
    };
  };
}
