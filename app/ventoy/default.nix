with import <nixpkgs> {};
pkgs.mkShell {
  name = "ventory";
  nativeBuildInputs = with pkgs; [
    ventoy-full
  ];
}
