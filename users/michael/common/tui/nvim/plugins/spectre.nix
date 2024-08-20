_: {
  programs.nixvim = {
    Plugins.spectre = {
      enable = true;
      settings = {
        replace = "sed";
      };
    };
  };
}
