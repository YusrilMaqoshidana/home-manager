{ config, pkgs, ... }:

{
  # Root
  imports = [
    ./../module/config.nix
    ./../module/packages.nix
  ];


  home.stateVersion = "24.11";   
}
