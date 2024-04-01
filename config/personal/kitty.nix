{ pkgs, ... }:

{
	programs.kitty.enable = true;
	programs.kitty.settings = {
		font_size = 12;
		cursor_shape = "underline";
		window_padding_width = 4;
		background_opacity = "0.8";
		background_blur = 3;
		font_family = "MesloLGS NF";
	};
}
