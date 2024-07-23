# User level sops configuration
{ inputs, config, ... }:
let
  secretsDirectory = builtins.toString inputs.nix-secrets;
  secretsFile = "${secretsDirectory}/secrets.yaml";
  homeDirectory = config.home.homeDirectory;
in
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the location of the host specific age-key for michael
    age.keyFile = "${homeDirectory}/.config/sops/age/keys.txt";

    defaultSopsFile = "${secretsFile}";
    validateSopsFiles = false;

    secrets = {
      "private_keys/michael" = {
        path = "${homeDirectory}/.ssh/id_ed25519_nix";
      };

      # "ssh_keys/sephiroth" = {
      #   path = "${homeDirectory}/.ssh/id_sephiroth";
      # };
    };
  };

}
