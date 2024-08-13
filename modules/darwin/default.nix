{specialArgs, ...}: {
  imports =
    specialArgs.myLibs.scanPaths ./.
    ++ (map myLibs.relativeToRoot [
      "modules/common/core.nix"
      "resources/lib/dock.nix"
    ]);
}
