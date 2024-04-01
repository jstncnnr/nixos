{ lib, config, pkgs, ... }:
let
	cfg = config.displayManagers.sddm;
in
{
	options.displayManagers.sddm = {
		enable = lib.mkEnableOption "enable sddm";
		sessions.hyprland = lib.mkEnableOption "enable hyprland session";
	};

	config = lib.mkIf cfg.enable {
		services.xserver.enable = true;
		services.xserver.displayManager.sddm.enable = true;
		services.xserver.displayManager.sddm.wayland.enable = true;

		programs.hyprland.enable = cfg.sessions.hyprland;
	};
}
