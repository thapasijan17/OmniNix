{ pkgs, specialArgs, ... }: {
  imports = specialArgs.myLibs.scanPaths ./.;
}
