{ pkgs, lib, ... }:

{
  imports = [
    ./bash.nix
    ./git.nix
    ./neovim.nix
    ./python.nix
    ./vscode.nix
  ];

  bash.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  neovim.enable = lib.mkDefault true;
  python.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
}
