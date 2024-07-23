{ pkgs, specialArgs, ... }: {

  imports =
    (specialArgs.myLibs.scanPaths ./.)
    ++ [
      # Common home manager configs for any envinroment
      ../common/cli
      ../common/shells

      # I can safely bring desktop configs into any darwin env as I dont run MacOS servers.
      ../common/desktop
      ../common/desktop/terminals

      ../common/home.nix
    ];

  # Home manager configs
  # UI apps on MacOS will get installed to /Users/username/Applications/Home Manager Apps
  home.packages = with pkgs; [
    cocoapods
    m-cli # useful macOS CLI commands
  ];

  programs = { };

}
