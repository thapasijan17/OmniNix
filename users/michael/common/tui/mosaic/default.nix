{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.mosaic.extend {
      config = {
        # core configs for nixvim that are not set in mosaic
        enableMan = true;
        viAlias = true;
        vimAlias = true;

        # Example of how to turn off manual plugins in Mosaic
        # plugs.sidebar.enable = false;

        # Example of how to overwrite settings of plugins
        # plugins.bufferline.settings.options.separator_style = "thick";

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
            libgit2_path = '${pkgs.libgit2.outPath}/lib/libgit2.1.7.2.dylib',
            external_diffview = true,
          }
        '';
      };
    })
  ];
}
