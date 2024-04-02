{ config, pkgs, inputs, ... }:

{
  imports = [
    ./waybar.nix
    ./kitty.nix
    ./hyprland.nix
  ];

  home.username = "work";
  home.homeDirectory = "/home/work";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.neovim
    pkgs.git
    pkgs.meslo-lgs-nf
    pkgs.dex
    pkgs.waybar
    pkgs.hypridle
    pkgs.hyprlock
    pkgs.hyprshot
    pkgs.wofi
    pkgs.xfce.thunar
    pkgs.xfce.thunar-archive-plugin
    pkgs.gnome.file-roller
    pkgs.arc-icon-theme
    pkgs.nordic
    pkgs.unzip
    pkgs.wl-clipboard
    pkgs.pavucontrol
    pkgs.blueman

    pkgs.spotify
    pkgs.google-chrome

    pkgs.cargo
    pkgs.rustc
  ];
}
