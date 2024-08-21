{
  programs.nixvim = {
    plugins.markdown-preview = {
      enable = true;
      settings = {
        theme = "dark";
      };
    };
  };
}
