{
  programs.k9s = {
    enable = true;

    catppuccin = {
      enable = true;
      flavor = "macchiato";
    };

    # https://k9scli.io/topics/config/
    settings.k9s = {
      ui = {
        # headless = true;
        # logoless = true;
        noIcons = true;
      };
      skipLatestRevCheck = true;
    };
  };
}
