{ config, pkgs, ... }:

{
  # Root
  imports = [
    ./modules/config.nix
    ./modules/packages.nix
  ];


  home.stateVersion = "24.11";   
}
