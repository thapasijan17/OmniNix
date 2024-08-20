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
