{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };
      # registrations = {
      #   "<leader>t" = " Terminal";
      # };
      window = {
        border = "none";
        winblend = 0;
      };
    };
  };
}
