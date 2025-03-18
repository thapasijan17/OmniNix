{
  ignores = [
    # General
    ".cache/"
    "tmp/"
    "*.tmp"
    "log/"
    ".DS_Store"
    "Desktop.ini"
    "Thumbs.db"
    "._*"
    ".Spotlight-V100"
    ".Trashes"

    # IDE
    "*.swp"
    ".idea/"
    ".~lock*"

    # Nix
    "result"
    "result-*"
    ".direnv/"

    # Node
    "node_modules/"
  ];
}
