# Python dev FHS environment
{ pkgs ? import <nixpkgs> {} }: 
(
  let base = pkgs.appimageTools.defaultFhsEnvArgs; in
  pkgs.buildFHSEnv (base // {
  name = "fhs";

  targetPkgs = pkgs: (with pkgs; [
    # Python
    python312
    python312Packages.pip

    # Basic
    gcc
    glibc
    zlib
  ]);
  runScript = "bash";
})).env
