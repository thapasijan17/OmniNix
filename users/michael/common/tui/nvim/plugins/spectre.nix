_: {
  programs.nixvim = {
    plugins.spectre = {
      enable = true;
      settings = {
        replace = "sed";
      };
    };
  };
}
