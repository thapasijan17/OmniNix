{
  # replacement of htop
  programs.btop = {
    enable = true;

    #overwrite catpuccin theme to be lighter
    catppuccin = {
      enable = true;
      flavor = "frappe";
    };

    settings = {
      theme_background = true; # make btop solid so we can overwrite the theme
    };
  };

}
