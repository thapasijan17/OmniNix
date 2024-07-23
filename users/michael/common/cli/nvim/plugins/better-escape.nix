{
  programs.nixvim = {
    plugins.better-escape = {
      mapping = [ "jk" ];
      enable = true;
      clearEmptyLines = true;
      timeout = 200;
    };
  };
}
