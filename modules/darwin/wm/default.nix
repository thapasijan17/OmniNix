{ myLibs, ... }: {
  imports = myLibs.scanPaths ./.;
}
