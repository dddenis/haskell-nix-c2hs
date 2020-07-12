{ hsPkgs ? import ./default.nix { } }:

hsPkgs.shellFor {
  exactDeps = true;
  # nativeBuildInputs = [ hsPkgs.c2hs.components.exes.c2hs ];
  # additional = p: [ p.c2hs ];
  tools = {
    cabal = "3.2.0.0";
    hie = "latest";
  };
}
