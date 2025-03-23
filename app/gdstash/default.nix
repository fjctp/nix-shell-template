# Install dependencies and run GDStash.
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; 
  let 
    gdstash = writeShellApplication {
      name = "start_gdstash";
      runtimeInputs = [ jdk17 ];
      text = ''
        cd GDStash_v177b
        java -jar ./GDStash.jar
      '';
    };
  in
  [
    gdstash
  ];
}
