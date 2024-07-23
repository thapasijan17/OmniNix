{ pkgs
, specialArgs
, ...
}: {

  # No matter what environment we are in we want these tools for root, and the user(s)
  environment = {
    systemPackages = with pkgs;
      [
        git # used by nix flakes

        # archives
        zip
        p7zip
        unrar # extract RAR archives
        xz # extract XZ archives


        # Text Processing
        # Docs: https://github.com/learnbyexample/Command-line-text-processing
        gnugrep # GNU grep, provides `grep`/`egrep`/`fgrep`
        gnused # GNU sed, very powerful(mainly for replacing text in files)
        wget
        curl # Will also install with brew on MacOS
        coreutils
      ];
  };

  nix = {
    settings = {
      # enable flakes globally
      experimental-features = [ "nix-command" "flakes" ];

      # See https://jackson.dev/post/nix-reasonable-defaults/
      connect-timeout = 5;
      log-lines = 25;
      min-free = 128000000; # 128MB
      max-free = 1000000000; # 1GB
      warn-dirty = false;
    };

    # Garbage Collection
    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };
  };
}
