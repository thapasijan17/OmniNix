{
  config,
  myVars,
  ...
}: let
  user = myVars.users.omninix.username;
in {
  # Fully declarative dock using the latest from Nix Store
  local = {
    dock.enable = true;
    dock.entries = [
      {
        path = "${config.users.users.${user}.home}/Downloads";
        section = "others";
        options = "--sort name --view list --display folder";
      }
      {
        path = "/Applications/";
        section = "others";
        options = "--sort name --view grid --display folder";
      }
    ];
  };
}
