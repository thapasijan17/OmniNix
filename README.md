# McGilly17's Nix Configs

Please dont take any of this repo as my own work. I am merely standing on the shoulders of giants like Ryan Yin, Emergent Mind, Mysterio77 and about 100 others. My dotfiles are a frankenstein from many of these amazing engineers.

## Table of Contents

- [Feature Highlights](#feature-highlights)
- [Roadmap of TODOs](TODO.md)
- [Structure](#structure-quick-reference)
- [Acknowledgements](#acknowledgements)

---

## Feature Highlights

- Flake-based multi-host, multi-user NixOS + Nix Darwin and Home-Manager configurations
  - Core configs for hosts and users
  - Somewhat modular, optional configs for user and host-specific needs

## Structure Quick Reference

- `flake.nix` - Entrypoint for hosts and user home configurations. Also exposes a devshell for  manual bootstrapping tasks (`nix develop` or `nix-shell`).
- `hosts` - NixOS configurations accessible via `sudo nixos-rebuild switch --flake .#<host>`.
  - `sephiroth` - M1 Macbook Air 2021
- `users/<user>` - Home-manager configurations, built automatically during host rebuilds.
  - `common` - shared home-manager configurations consumed the user's machine specific ones present for user across all machines. This is a hard rule!
    - `cli` - Home-manager configurations for anything CLI or TUI
    - `desktop` - Home-manager configurations for anything desktop, these will only be imported by machines that run a GUI
    - `shells` - Different shell configurations. Currently only zsh is configured here.
  - `darwin` - Darwin (MacOS) specific home-manager configurations for that user
  - `hosts` - Host specific configurations
  - `linux` - Linux specific home-manager configurations for that user
- `resrouces` - Resources used throughout the config
  - `libs` - Custom libraries used throughout the nix-config to make import paths more readable.
  - `vars` - Custom variables used throughout the nix-config. Most of the variables are focused on the primary user across all hosts.
- `modules` - Global Darwin and Linux configurations
  - `darwin` - Apps, system and core nix configurations for Darwin (MacOS) devices. Brew is a necessary evil still and it is defined here.
    - `wm` - Configuration for window management on MacOS with Yabai and skhd
  - `nixos` - will contain any global nixos configurations
- `overlays` - Custom modifications to upstream packages.

## Acknowledgements

Thank you to the amazing engineers work that I have built my dotfiles on top of

- [Misterio77]  (<https://github.com/Misterio77/nix-config?tab=readme-ov-file>)
- [EmergentMind]  (<https://github.com/EmergentMind/nix-config>)
- [ryan4yin]  (<https://github.com/ryan4yin/nix-config/tree/main>)
- [pietersp]  (<https://github.com/pietersp/dotfiles>)
- [Zumorica]  (<https://github.com/Zumorica/GradientOS/>)
- [ritiek]  (<https://github.com/ritiek/dotfiles>)
- [the] -(argus <https://github.com/the-argus/nixsys>)
- [andreykaipov]  (<https://github.com/andreykaipov/nix>)
- [martaver]  (<https://github.com/martaver/dotfiles>)
- [mtyurt]  (<https://github.com/mtyurt/dotfiles>)
