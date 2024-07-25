{
  programs.nixvim = {
    plugins.better-escape = {
      enable = true;
      settings = {
        mapping = [ "jk" ];
        timeout = 200;
      };
    };
  };
}
