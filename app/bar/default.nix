# Run Beyond All Reason (BAR) using AppImage.
# Note: it takes a minute to start for the first time. You may see a blank screen.

let
  # Pin nixpkgs.
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };

  # Add packages to appimage-run environment.
  appimage-override = pkgs.appimage-run.override {
    extraPkgs = pkgs: [ pkgs.openal ]; 
  };

  # A shell script to start BAR using appimage-run. See https://nixos.wiki/wiki/Nvidia#Optimus_PRIME_Option_A:_Offload_Mode
  start_bar = pkgs.writeShellApplication {
    name = "start_bar";
    runtimeInputs = [ appimage-override ];
    text = ''
      # nvidia-offload add environment variables
      nvidia-offload bash -c "appimage-run ./bar.AppImage"
    '';
  };
in
pkgs.mkShellNoCC {
  name = "bar";
  packages = [
    start_bar
  ];

  shellHook = ''
    # Add OpenGL lib path to nix-ld.
    export LD_LIBRARY_PATH=/run/opengl-driver/lib/

    echo "To run BAR, run \"start_bar\"".
  '';
}
