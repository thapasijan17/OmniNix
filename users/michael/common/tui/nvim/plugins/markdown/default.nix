{
  specialArgs,
  pkgs,
  ...
}: {
  imports = specialArgs.myLibs.scanPaths ./.;
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      bullets-vim
      outline-nvim
    ];
    extraConfigLua = ''
      require("outline").setup { }
    '';
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cs";
        action = "<cmd>Outline<CR>";
        options = {
          desc = "Toggle Code Structure";
        };
      }
    ];
  };
}
