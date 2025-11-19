# nix-shell-template
A collection of `nix-shell` templates

## Usage

- Clone the repo or download desired `*.nix`.
- Rename it to `default.nix` and place it in desired location.
- Run `nix-shell`.

## nix-shell Environment
A `nix-shell` environment is a temporary, isolated development environment created by `Nix`. It provides specific packages and dependencies without installing them permanently on your system.

**Type of environments:**

- Basic: `mkShell`, a basic shell environment. Great for a quick simple development environment.
- FHS: `buildFHSUserEnv`, Linux FHS environment. Great for programs that need a traditional Linux filesystem structure (ex. `/lib`).

### Basic

```nix
{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; 
  let 
    helloworld = writeShellApplication {
      name = "helloworld";
      text = ''
        echo "Hello, world"
      '';
    };
  in
  [
    helloworld
  ];
}
```

### FHS

```nix
{ pkgs ? import <nixpkgs> {} }: 
(pkgs.buildFHSUserEnv {
  name = "fhs-env";
  targetPkgs = pkgs: (with pkgs; [
    # Python
    python312
  ]);
  runScript = "bash";
}).env
```

## Snippet

### Pin nixpkgs to a version or a hash.
```nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
pkgs.mkShellNoCC {
  ...
  packages = with pkgs; [
    xyz
  ];
  ...
}
```
