let
  # Pin nixpkgs to a specific version.
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
  pkgs = import nixpkgs { config = { allowUnfree = true; }; overlays = []; };
in
pkgs.mkShellNoCC {
  packages = with pkgs; [
    rustc
    clang
  ];
}
