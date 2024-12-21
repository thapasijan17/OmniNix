{
  # replacement of htop
  programs.btop = {
    enable = true;
    settings = {
      theme_background = true; # make btop solid so we can overwrite the theme
    };
  };
}
