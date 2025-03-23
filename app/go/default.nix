# Install golang and set environment variables.
{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    name = "nix-template";
    nativeBuildInputs = [ pkgs.go_1_17 ];
    shellHook = ''
      export GOPATH=$PWD/go
      export PATH=$PATH:$PWD/go/bin
    '';
}
