{
  description = "A collection of Nix templates that I use on a regular basis.";

  outputs = { self }: {
    templates = {
      unstable-utils = {
        path = ./unstable-utils;
        description = "Nix Flake template using the 'nixpkgs-unstable' branch and 'flake-utils'";
      };
    };
  };
}
