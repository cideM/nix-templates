{
  description = "Simple Rust Flake";

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
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
          ];

          buildInputs = with pkgs; [
            # Toolchain from nixpkgs. Fine as long as the project has no
            # rust-toolchain.toml pinning something else.
            cargo
            rustc
            rustfmt
            clippy
            rust-analyzer

            openssl
          ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ libiconv ];

          # Lets rust-analyzer find the stdlib sources for go-to-definition.
          RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

          # openssl-sys on macOS probes /opt/homebrew, /opt/pkg and /opt/local
          # before it asks pkg-config, so a MacPorts or Homebrew OpenSSL would
          # win over the Nix one and drag /opt/local/lib onto the link line.
          # Pointing it at the Nix OpenSSL explicitly skips that probe.
          OPENSSL_LIB_DIR = "${pkgs.lib.getLib pkgs.openssl}/lib";
          OPENSSL_INCLUDE_DIR = "${pkgs.lib.getDev pkgs.openssl}/include";
        };
      }
    );
}
