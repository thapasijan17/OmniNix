{
  inputs,
  config,
  ...
}: let
  secretsDirectory = builtins.toString inputs.nix-secrets;
  secretsFile = "${secretsDirectory}/secrets.yaml";
in {
  imports = [
    inputs.sops-nix.darwinModules.sops
  ];
  sops = {
    defaultSopsFile = secretsFile;
    validateSopsFiles = false;
    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      michaelEmail = {};
    };
  };
}
