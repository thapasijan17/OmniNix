{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "surround-ui.nvim";
        version = "1.0.0";
        src = pkgs.fetchFromGitHub {
          owner = "roobert";
          repo = "surround-ui.nvim";
          rev = "40abcba017a943d6d3dd304e523f34a43d80405b";
          sha256 = "sha256-sUtu+Z20rDh9mefTwvEJVI4g7oL+FuYdY9bmGrWcrM0=";
        };
      })
      nvim-surround
    ];

    extraConfigLua = ''
      require("nvim-surround").setup({})
      require("surround-ui").setup({})
    '';
  };
}
