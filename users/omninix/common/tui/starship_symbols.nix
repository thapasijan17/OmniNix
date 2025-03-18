{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  programs.starship.settings = {
    # Language Symbols
    docker_context.symbol = mkDefault "";
    python.symbol = mkDefault " ";
    package.symbol = mkDefault " ";
    nix_shell.symbol = mkDefault " ";

    # Git Symbols
    git_branch.symbol = mkDefault " ";
    git_commit.tag_symbol = mkDefault " ";
    git_status.format = mkDefault "([$all_status$ahead_behind]($style) )";
    git_status.conflicted = mkDefault " ";
    git_status.ahead = mkDefault " ";
    git_status.behind = mkDefault " ";
    git_status.diverged = mkDefault "󰃻 ";
    git_status.untracked = mkDefault " ";
    git_status.stashed = mkDefault " ";
    git_status.modified = mkDefault " ";
    git_status.staged = mkDefault " ";
    git_status.renamed = mkDefault " ";
    git_status.deleted = mkDefault " ";

    # System Symbols
    battery.full_symbol = mkDefault "󰁹";
    battery.charging_symbol = mkDefault "󰂉";
    battery.discharging_symbol = mkDefault "󱟟";
    battery.unknown_symbol = mkDefault "󰂑";
    battery.empty_symbol = mkDefault "󱉞";

    # hyperscaler symbols
    aws.symbol = mkDefault "🅰 ";
    gcloud.symbol = mkDefault " ";
  };
}
