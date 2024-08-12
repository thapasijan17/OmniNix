{
  config,
  myVars,
  ...
}: let
  user = myVars.users.michael.username;
in {
  # Fully declarative dock using the latest from Nix Store
  local = {
    dock.enable = true;
    dock.entries = [
      {path = "/System/Applications/Messages.app/";}
      {path = "/System/Applications/Facetime.app/";}
      {
        path = "${config.users.users.${user}.home}/Downloads";
        section = "others";
        options = "--sort name --view grid --display folder";
      }
    ];
  };
}
