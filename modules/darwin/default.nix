{ specialArgs, ... }: {
  imports =
    specialArgs.myLibs.scanPaths ./.
    ++ [
      ../common/core.nix
      ./dock/dock-config.nix
    ];
}
