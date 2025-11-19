# Install golang and set environment variables.
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    name = "nix-template";
    nativeBuildInputs = [ pkgs.go_1_17 ];
}
