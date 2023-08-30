{ mkDerivation, base, lib }:
mkDerivation {
  pname = "haskell-starter";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = "unknown";
  mainProgram = "haskell-starter";
}
