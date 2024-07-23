{ inputs
, lib
,
}: {
  users = {
    michael = {
      username = "michael";
      #domain = inputs.nix-secrets.domain;
      userFullName = "Michael Paterson"; #inputs.nix-secrets.full-name;
      handle = "McGilly17";
      userEmail = "mpaterson192@gmail.com";
      gitEmail = "mpaterson192@gmail.com";
      #workEmail = inputs.nix-secrets.work-email;
      #networking = import ./networking.nix { inherit lib; };
      #persistFolder = "/persist";
      # isMinimal = false; # Used to indicate nixos-installer build
    };
  };
}
