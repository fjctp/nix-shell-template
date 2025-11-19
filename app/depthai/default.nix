# Python dev FHS environment, customized for [DepthAI](https://github.com/luxonis/depthai)
#
# See also
# - https://github.com/gfx-rs/wgpu/issues/3033#issuecomment-1741255540
# - https://docs-old.luxonis.com/en/latest/pages/troubleshooting/#udev-rules-on-linux
# - https://docs-old.luxonis.com/en/latest/pages/troubleshooting/
# - https://github.com/luxonis/depthai/issues/518

{ pkgs ? import <nixpkgs> {} }: 
(pkgs.buildFHSEnv {
  name = "depthAI";
  targetPkgs = pkgs: (with pkgs; [
    # Python
    python312
    python312Packages.pip
    # Numpy
    gcc
    glibc
    zlib
    # Display
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    wayland
    libxkbcommon
    # Drivers (WGPU Error)
    libGL
    vulkan-loader
    # libgthread
    glib
    # lsusb
    usbutils
  ]);
  runScript = "bash";
}).env
