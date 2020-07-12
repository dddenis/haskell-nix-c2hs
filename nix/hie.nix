src: self: super:

let
  hie = args:
    super.haskell-nix.project (args // {
      name = "haskell-ide-engine";
      inherit src;
      projectFileName = "stack.yaml";
    });

  extra-custom-tools = {
    hie.latest = args: (hie args).haskell-ide-engine.components.exes.hie;
    hie-wrapper.latest = args:
      (hie args).haskell-ide-engine.components.exes.hie-wrapper;
  };

in {
  haskell-nix = super.haskell-nix // {
    custom-tools = super.haskell-nix.custom-tools // extra-custom-tools;
  };
}
