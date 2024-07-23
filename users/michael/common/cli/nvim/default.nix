{ pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    #Base Configs
    ./sets.nix
    ./colorschemes.nix
    ./keymaps.nix

    # Plugins
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    enableMan = true; # install man pages for nixvim options

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;

    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  };
}
