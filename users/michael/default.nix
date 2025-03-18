{ pkgs
, specialArgs
, config
, ...
}:
let
  inherit (specialArgs.myVars.users) omninix;
in
{
  # Define the user account for omninix.
  users.users."${omninix.username}" = {
    home = "/Users/${omninix.username}";
    description = "${omninix.userFullName}";
  };

  # Import omninix's home manager configuration for the current host.
  home-manager.users.${omninix.username} = import (specialArgs.myLibs.relativeToRoot "users/${omninix.username}/hosts/${config.networking.hostName}.nix");
}
