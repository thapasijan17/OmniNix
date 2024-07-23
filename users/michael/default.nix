{ pkgs
, specialArgs
, config
, ...
}:
let
  inherit (specialArgs.myVars.users) michael;
in
{
  # Define the user account for michael.
  users.users."${michael.username}" = {
    home = "/Users/${michael.username}";
    description = "${michael.userFullName}";
  };

  # Import Michael's home manager configuration for the current host.
  home-manager.users.${michael.username} = import (specialArgs.myLibs.relativeToRoot "users/${michael.username}/hosts/${config.networking.hostName}.nix");
}
