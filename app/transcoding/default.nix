{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = with pkgs.buildPackages; [ 
        jellyfin-ffmpeg # ffmpeg built with HW accel
        libva-utils # vainfo
    ];
    shellHook = ''
        # Check hardware used by hardware acceleration library.
        # LIBVA_DRIVER_NAME="nvidia" vainfo
        LIBVA_DRIVER_NAME=iHD vainfo --display drm --device /dev/dri/renderD128
    '';
}