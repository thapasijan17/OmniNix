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
      {path = "/Applications/Chrome.app/";}
      {path = "/Applications/Notion.app/";}
      {
        path = "/Applications/";
        section = "others";
        options = "--sort name --view grid --display folder";
      }
      {
        path = "${config.users.users.${user}.home}/Downloads";
        section = "others";
        options = "--sort name --view list --display folder";
      }
    ];
  };
}
