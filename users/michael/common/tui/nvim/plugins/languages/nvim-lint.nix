{pkgs, ...}: {
  home.packages = with pkgs; [
    selene
    eslint_d
    nodePackages.jsonlint
    checkstyle
    markdownlint-cli2
  ];
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        nix = ["statix"];
        lua = ["selene"];
        python = ["flake8"];
        javascript = ["eslint_d"];
        javascriptreact = ["eslint_d"];
        markdown = ["markdownlint-cli2"];
        typescript = ["eslint_d"];
        typescriptreact = ["eslint_d"];
        json = ["jsonlint"];
        java = ["checkstyle"];
      };
    };
  };
}
