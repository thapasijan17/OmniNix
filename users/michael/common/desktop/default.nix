{ specialArgs, pkgs, ... }: {
  imports = [
    ./_1passwordcli.nix
  ];

  home.packages = with pkgs; [
    deluge
  ];
}
