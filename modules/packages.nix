{ config, pkgs, ...  }:

{
  home.packages = [
       pkgs.trash-cli 
       pkgs.jdk17
       pkgs.flatpak
       pkgs.neofetch
       pkgs.go
       pkgs.docker-client
       pkgs.jetbrains.idea-ultimate
       pkgs.maven
       pkgs.gradle
       pkgs.zoom-us
       pkgs.postman
       pkgs.spotify
       pkgs.pgadmin4-desktopmode
       pkgs.postgresql_16
       pkgs.kafkactl
       pkgs.firefox
       pkgs.flutter
       pkgs.wpsoffice
  ];
}
