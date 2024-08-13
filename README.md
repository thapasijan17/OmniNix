<h2 align="center">:snowflake: McGilly17's Nix Config :snowflake:</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="400" />
</p>

Please dont take any of this repo as my own work. I am merely standing on the shoulders of giants like Ryan Yin, Emergent Mind, Mysterio77 and about 100 others. My dotfiles are a frankenstein made from many of [these](#acknowledgements) amazing engineers work.

## Table of Contents

- [Feature Highlights](#feature-highlights)
- [Roadmap of TODOs](TODO.md)
- [Structure](#structure-quick-reference)
- [Acknowledgements](#acknowledgements)

---

## Feature Highlights

- Flake-based multi-host, multi-user NixOS + Darwin and Home-Manager configurations
- Core configs for hosts and users
- Somewhat modular, optional configs for user and host-specific needs
- **secrets** management using **sops-nix**
- Catppuccin **everywhere** with nix

## Structure Quick Reference

At a high level, the configs flow from the flake.nix, through the hosts folder and into the users folder. Each host will bring in `/modules` to bring in OS level configurations that are either for darwin, nixos or common but are not specific to the host. Host specific changes can be made in the host folder `/hosts/HOSTNAME`.

These configs use home-manager to manage user level configurations. Users to be brought into a host are set in the host file. All user specific configurations are done in the users foler `/users/USERNAME`. There is some complexity when working with darwin as it is often still better to install apps either through MAS (appstore) or brew and as such they arent managed in home-manager, rather through darwin. I will no doubt iron out some of these issues as I start to manage configs across nixos and darwin builds. For the moment it is what it is.

The strucutre allows for many hosts (nixos, darwin and probably WS2?) and many users. There are, however, some user limitations in darwin given that a user has to be set on setup. I have never tried to workaround it, instead i just always assume there will be at least my main users `michael` in any darwin computer. At somepoint if I actually need to, ill add a second uer to a mac but that need hasnt arised yet.

- `flake.nix` - Entrypoint for hosts and user home configurations. Also exposes a devshell for manual bootstrapping tasks (`nix develop` or `nix-shell`).
- `hosts` - NixOS configurations accessible via `sudo nixos-rebuild switch --flake .#<host>`.
  - `sephiroth` - M1 Macbook Air 2021
- `users/<user>` - Home-manager configurations, built automatically during host rebuilds.
  - `common` - shared home-manager configurations consumed the user's machine specific ones present for user across all machines. This is a hard rule!
    - `core` - Core tools and configs for terminal
    - `tui` - Home-manager configurations for anything CLI or TUI
    - `desktop` - Home-manager configurations for anything desktop, these will only be imported by machines that run a GUI
    - `shells` - Different shell configurations. Currently only zsh is configured here.
  - `darwin` - Darwin (MacOS) specific home-manager configurations for that user
  - `hosts` - Host specific configurations
  - `linux` - Linux specific home-manager configurations for that user
- `resources` - Resources used throughout the config
  - `lib` - Custom libraries used throughout the nix-config
    - `default.nix` - libraries to make import paths more readable.
  - `vars` - Custom variables used throughout the nix-config. Most of the variables are focused on the primary user across all hosts.
- `modules` - Global Darwin and Linux configurations
  - `darwin` - Apps, system and core nix configurations for Darwin (MacOS) devices. Brew is a necessary evil still and it is defined here.
    - `wm` - Configuration for window management on MacOS with Yabai and skhd
  - `nixos` - will contain any global nixos configurations
  - `common` - Common configuration at the host level that is agnostic of OS
- `overlays` - Custom modifications to upstream packages.

## Components

---

|                             | Linux          | MacOS          |
| --------------------------- | -------------- | -------------- |
| **Shell:**                  | zsh + Starship | zsh + Starship |
| **WM:**                     | TODO           | Yabai + skhd   |
| **Editor:**                 | NixVim         | NixVim         |
| **Terminal Emulator:**      | Kitty + Zellij | Kitty + Zellij |
| **Browser:**                | Chrome         | Chrome         |
| **Color Scheme**            | Catppuccin     | Catppuccin     |
| **System resource monitor** | Btop           | Btop           |
| **File Manager**            | Yazi           | Yazi           |

---

## Usage

> [!IMPORTANT]
> **Disclaimer:** _This is not a "community framework" or "NixOS distribution"._
> Please do not use it like one. It is a relatively poor and somewhat frankenstein
> implementation from many, many people (see [Acknowledgements](#acknowledgements)) who are far smarter
> than I.
>
> That said, I would absolutely love to talk more about nix and configs. If anyone would like to critique,
> comment, contribute. Please feel free in Issues or PRs.

## Ongoing

See [TODOs](/TODO.md)

In short, I will be constantly tinkering with these configs. I want to improve the use of secrets, investigate remote deployments,
use Just files and many other fun things.

## Acknowledgements

Thank you to the amazing engineers work that I have built my dotfiles on top of

- [Misterio77] (<https://github.com/Misterio77/nix-config?tab=readme-ov-file>)
- [EmergentMind] (<https://github.com/EmergentMind/nix-config>)
- [ryan4yin] (<https://github.com/ryan4yin/nix-config/tree/main>)
- [pietersp] (<https://github.com/pietersp/dotfiles>)
- [Zumorica] (<https://github.com/Zumorica/GradientOS/>)
- [ritiek] (<https://github.com/ritiek/dotfiles>)
- [the-argus] <https://github.com/the-argus/nixsys>)
- [andreykaipov] (<https://github.com/andreykaipov/nix>)
- [martaver] (<https://github.com/martaver/dotfiles>)
- [mtyurt] (<https://github.com/mtyurt/dotfiles>)
- [redyf] (https://github.com/redyf/Neve)
