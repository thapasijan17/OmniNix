{
  programs.k9s = {
    enable = true;

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
