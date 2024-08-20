{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimUtils; [
      (buildVimPlugin {
        pname = "stay-centered.nvim";
        version = "2024-02-07";
        src = pkgs.fetchFromGitHub {
          owner = "arnamak";
          repo = "stay-centered.nvim";
          rev = "91113bd82ac34f25c53d53e7c1545cb5c022ade8";
          sha256 = "sha256-DDhF/a8S7Z1aR1Hg8UVgttl3je0hhn/OpZoakOeMHQw=";
        };
      })
    ];
    extraConfigLua = "require('stay-centered').setup({})";
  };
}
