{ pkgs, ... }: {
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      eyeliner.nvim
    ];

    extraConfigLua = ''
      require("eyeliner").setup({
        -- show highlights only after keypress
        highlight_on_key = true,
      })
    '';
  };
}
