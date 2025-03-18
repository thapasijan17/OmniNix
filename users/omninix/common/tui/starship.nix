{ pkgs, lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      directory.fish_style_pwd_dir_length = 1; # turn on fish directory truncation
      memory_usage.disabled = true; # because it includes cached memory it's reported as full a lot
      format =
        let
          git = "$git_branch$git_commit$git_state$git_status";
          cloud = "$aws$gcloud$openstack";
        in
        ''
          $username$hostname($shlvl)($cmd_duration) $fill ($nix_shell)
          $directory(${git})(${cloud}) $fill $time
          $jobs$character
        '';

      fill = {
        symbol = " ";
        disabled = false;
      };

      # Core
      username = {
        format = "[$user]($style)";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold green";
      };

      shlvl = {
        format = "[$shlvl]($style) ";
        style = "bold cyan";
        threshold = 3;
        repeat = true;
        disabled = false;
      };

      cmd_duration = {
        format = "took [$duration]($style) ";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };

      nix_shell = {
        format = "[($name \\(develop\\) <- )$symbol]($style) ";
        impure_msg = "";
        symbol = " ";
        style = "bold red";
      };

      character = {
        error_symbol = "[~›](bold red)";
        success_symbol = "[›](bold green)";
      };

      time = {
        format = "\\\[[$time]($style)\\\]";
        disabled = false;
      };

      # Cloud
      gcloud = {
        format = "on [$symbol$active(/$project)(\\($region\\))]($style)";
      };
      # do not show the account/project's info
      # to avoid the leak of sensitive information when sharing the terminal
      # format = "on [$symbol$active(\($region\))]($style) ";

      aws = {
        format = "on [$symbol$profile(\\($region\\))]($style)";
      };
    };

  };
}
