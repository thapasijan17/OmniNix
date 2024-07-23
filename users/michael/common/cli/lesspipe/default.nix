{
  programs.lesspipe.enable = true;

  home.file = {
    ".config/.lessfilter" = {
      source = ./lessfilter;
      executable = true;
    };
  };
}
