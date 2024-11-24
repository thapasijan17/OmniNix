# User level sops configuration
{
  inputs,
  config,
  ...
}: let
  secretsDirectory = builtins.toString inputs.nix-secrets;
  secretsFile = "${secretsDirectory}/secrets.yaml";
  homeDirectory = config.home.homeDirectory;
in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    # This is the location of the host specific age-key for michael
    age = {
      # this will use an age key that is expected to already to be in the file system
      keyFile = "${homeDirectory}/.config/sops/age/keys.txt";
    };

    defaultSopsFile = "${secretsFile}";
    validateSopsFiles = false;

    secrets = {
      "private_keys/michael" = {
        path = "${homeDirectory}/.ssh/id_ed25519";
      };
      openAIKey = {};
    };
  };
}
