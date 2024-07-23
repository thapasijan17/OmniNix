{ outputs
, lib
, ...
}: {
  programs.ssh = {
    enable = true;
  };
}
