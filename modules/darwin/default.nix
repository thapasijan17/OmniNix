{ specialArgs, ... }: {
  imports =
    specialArgs.myLibs.scanPaths ./.
    ++ [
      ../core.nix
    ];
}
