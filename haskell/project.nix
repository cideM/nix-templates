{ mkDerivation, array, base, containers, extra, fgl, flow, lib, mtl
, optparse-generic, pretty-simple, streamly, text, trifecta
, unordered-containers
}:
mkDerivation {
  pname = "haskell-starter";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    array base containers extra fgl flow mtl optparse-generic
    pretty-simple streamly text trifecta unordered-containers
  ];
  license = "unknown";
  hydraPlatforms = lib.platforms.none;
}
