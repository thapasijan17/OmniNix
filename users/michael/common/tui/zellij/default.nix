let
  shellAliases = {
    "zj" = "zellij";
  };
in
{
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".source = ./config.kdl;

  home.shellAliases = shellAliases;
}
