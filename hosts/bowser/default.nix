#############################################################
#
#  Bowser - MacBook Pro 16" M1 Max
#  MacOS
#
###############################################################
{
  inputs,
  pkgs,
  specialArgs,
  myLibs,
  config,
  ...
}: let
  hostname = "bowser";
  inherit (specialArgs.myVars.users) omninix;
in {
  imports =
    [
      inputs.home-manager.darwinModules.home-manager
      inputs.nix-homebrew.darwinModules.nix-homebrew
    ]
    ++ (map myLibs.relativeToRoot [
      #Common Darwin Modules
      "modules/darwin"

      # Deskotop Brew Apps
      "modules/darwin/apps/desktop.nix"
      "modules/darwin/apps/creative.nix"
      "modules/darwin/apps/development.nix"

      #User configs for OmniNix
      "users/omninix"
    ]);

  #################### Host specific Darwin Configs ####################

  networking = {
    hostName = hostname;
    computerName = hostname;
  };

  system.defaults.smb.NetBIOSName = hostname;

  #################### Home Manager Configs ####################

  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;
  };

  #################### Homebrew Configs ####################

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = false;

    # User owning the Homebrew prefix
    user = "omninix";

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
    };

    # Optional: Enable fully-declarative tap management
    #
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.

    mutableTaps = false;
  };

  # as per https://daiderd.com/nix-darwin/manual/index.html#opt-system.stateVersion
  system.stateVersion = 5; # Did you read the comment?
}
