{ sources ? import ./nix/sources.nix }:

let
  haskellNix = import sources."haskell.nix" { };
  hie = import ./nix/hie.nix sources.haskell-ide-engine;

  pkgs = import haskellNix.sources.nixpkgs-2003 (haskellNix.nixpkgsArgs // {
    overlays = haskellNix.nixpkgsArgs.overlays ++ [ hie ];
  });

in pkgs.haskell-nix.project {
  name = "haskell-nix-c2hs";
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "haskell-nix-c2hs";
    src = ./.;
  };
  compiler-nix-name = "ghc883";
  modules = [
    {
      nonReinstallablePkgs = [
        "array"
        "base"
        "deepseq"
        "ghc-boot-th"
        "ghc-heap"
        "ghc-prim"
        "integer-gmp"
        "integer-simple"
        "pretty"
        "rts"
        "template-haskell"
        # ghcjs custom packages
        "ghcjs-prim"
        "ghcjs-th"

        # !config.reinstallableLibGhc
        "Win32"
        "array"
        "binary"
        "bytestring"
        "containers"
        "directory"
        "filepath"
        "ghc"
        "ghc-boot"
        "ghc-compact"
        "ghc-prim"
        # "ghci" "haskeline"
        "hpc"
        "mtl"
        "parsec"
        "process"
        "terminfo"
        "text"
        "time"
        "transformers"
        "unix"
        "xhtml"
        # "stm"
      ];
    }
  ];
}
