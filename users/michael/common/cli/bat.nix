{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR"; # auto close if you can fit all onto screen
    };
  };
}
