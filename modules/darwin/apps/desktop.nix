{pkgs, ...}: {
  ### Desktop only Apps
  homebrew = {
    casks = [
      "autodesk-fusion" # Autodesk CAD Software
      "altserver" # Server for signging Apollo to my IOS
      "adobe-creative-cloud" # For installing Lightroom
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
    ];
  };
}
