{pkgs, ...}: {
  home.packages = [
    (pkgs.mosaic.extend {
      config = {
        # core configs for nixvim that are not set in mosaic
        enableMan = true;
        viAlias = true;
        vimAlias = true;

        keymaps = [
          # Addinf Fugit keymaps
          {
            mode = ["n"];
            key = "<leader>gf";
            action = "<cmd>Fugit2<cr>";
            options = {
              silent = true;
              noremap = true;
              desc = "Fugit";
            };
          }
          {
            mode = ["n"];
            key = "<leader>gb";
            action = "<cmd>Fugit2Blame<cr>";
            options = {
              silent = true;
              noremap = true;
              desc = "Fugit Blame";
            };
          }
          {
            mode = ["n"];
            key = "<leader>gd";
            action = "<cmd>Fugit2Diff<cr>";
            options = {
              silent = true;
              noremap = true;
              desc = "Fugit Diff";
            };
          }
        ];

        # Fugit2 needs to be installed here, this is due to its dependency on
        # libgit2 and how it needs to be linked (with the path)
        extraPlugins = with pkgs.vimUtils; [
          # NOTE: Manual pkg install, check update
          (buildVimPlugin {
            pname = "fugit2.nvim";
            version = "0.2.1";
            src = pkgs.fetchFromGitHub {
              owner = "SuperBo";
              repo = "fugit2.nvim";
              rev = "e8b262d3f974a301b9efae98a571e6c9e635ab16";
              sha256 = "sha256-U9Ve7mgJlQwArgDBOXC2ezaaG7zIOJalLEl5Hyw2jMA=";
            };
          })
        ];
        extraConfigLua = ''
          require('fugit2').setup{
            libgit2_path = '${pkgs.libgit2.outPath}/lib/libgit2.${pkgs.libgit2.version}.dylib',
            external_diffview = true,
          }
        '';
      };
    })
  ];
}
