{ pkgs, ... }:

{
	wayland.windowManager.hyprland.enable = true;
	wayland.windowManager.hyprland.xwayland.enable = true;
	wayland.windowManager.hyprland.settings = {
		input = {
			kb_layout = "us";
			follow_mouse = 1;
			sensitivity = -0.5;
			touchpad = {
				natural_scroll = false;
				scroll_factor = 0.4;
			};
		};

		general = {
			gaps_in = 4;
			gaps_out = 8;
			border_size = 2;
			layout = "dwindle";
			allow_tearing = false;

			"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
			"col.inactive_border" = "rgba(595959aa)";
		};

		decoration = {
			rounding = 0;
			drop_shadow = true;
			shadow_range = 4;
			shadow_render_power = 3;

			"col.shadow" = "rgba(1a1a1aee)";

			blur = {
				enabled = true;
				size = 3;
				passes = 1;
			};
		};

		animations = {
			enabled = true;

			bezier = [
				"myBezier, 0.05, 0.9, 0.1, 1.05"
			];

			animation = [
				"windows, 1, 7, myBezier"
				"windowsOut, 1, 7, default, popin 80%"
				"border, 1, 20, default"
				"borderangle, 1, 16, default"
				"fade, 1, 7, default"
				"workspaces, 1, 6, default"
			];
		};

		dwindle = {
			pseudotile = true;
			preserve_split = true;
			force_split = 2;
			split_width_multiplier = 1.5;
		};

		master = {
			new_is_master = true;
		};

		misc = {
			force_default_wallpaper = 0;
			key_press_enables_dpms = true;
			mouse_move_enables_dpms = true;
		};

		env = [
			"GTK_THEME,Nordic"
		];

		windowrulev2 = [
			"suppressevent maximize, class:.*"
			"workspace 4 silent, class:(Spotify)"
		];

		bind = [
			"SUPER, Return, exec, kitty"
			"SUPER, Q, killactive, "
			"SUPER, M, exit, "
			"SUPER, V, togglefloating, "
			"SUPER, P, pseudo, "
			"SUPER, J, togglesplit, "

			"SUPER, L, exec, hyprlock"
			"SUPER, Space, exec, wofi --style ~/.config/wofi/themes/catppuccin/src/latte/style.css --conf ~/.config/wofi/themes/catppuccin/config/config --show drun"
			" , PRINT, exec, hyprshot -m region --clipboard-only"
			"SUPER, E, exec, thunar"
			"SUPER, B, exec, google-chrome-stable"

			"SUPER, left, movefocus, l"
			"SUPER, right, movefocus, r"
			"SUPER, up, movefocus, u"
			"SUPER, down, movefocus, d"
			
			"SUPER, S, togglespecialworkspace, magic"
			"SUPER SHIFT, S, movetoworkspacesilent, special:magic"
		] ++ (
			builtins.concatLists(builtins.genList(
				x: let
					ws = let
						c = (x + 1) / 7;
					in
						builtins.toString(x + 1 - (c * 7));
				in [
					"SUPER, ${ws}, workspace, ${toString(x + 1)}"
					"SUPER SHIFT, ${ws}, movetoworkspacesilent, ${toString(x + 1)}"
				]
			) 6)
		);

		bindm = [
			"SUPER, mouse:272, movewindow"
			"SUPER, mouse:273, resizewindow"
		];

		exec-once = [
			"hypridle &"
			"waybar &"
			"dex -a"
		];
	};

	xdg.configFile."hypr/hypridle.conf" = {
		enable = true;
		text = ''
			listener {
				timeout = 300
				on-timeout = hyprlock
			}

			listener {
				timeout = 380
				on-timeout = hyprctl dispatch dpms off
				on-resume = hyprctl dispatch dpms on
			}

			listener {
				timeout = 1800
				on-timeout = systemctl suspend
			}
		'';
	};

	xdg.configFile."hypr/hyprlock.conf" = {
		enable = true;
		text = ''
			background {
			    monitor = DP-1
			    # path = ~/.local/wallpapers/wallpaper.jpg
			    color = rgb(0, 0, 0)

			    blur_size = 4
			    blur_passes = 3
			    noise = 0.0117
			    contrast = 1.3000
			    brightness = 0.8000
			    vibrancy = 0.2100
			    vibrancy_darkness = 0.0
			}

			input-field {
			    monitor = DP-1
			    size = 250, 50
			    outline_thickness = 3
			    dots_size = 0.2
			    dots_spacing = 0.64
			    dots_center = true
			    fade_on_empty = false
			    placeholder_text = <i>Password...</i>
			    hide_input = false
			    position = 0, 50
			    halign = center
			    valign = bottom
			}

			label {
			    monitor = DP-1
			    text = cmd[update:1000] echo "<b><big> $(date +"%I:%M %p") </big></b>"
			    font_size = 64
			    font_family = JetBrains Mono Nerd Font 10
			    position = 0, 16
			    halign = center
			    valign = center
			}

			label {
			    monitor = DP-1
			    text = Hey <span text_transform="capitalize" size="larger">$USER</span>
			    font_size = 20
			    font_family = JetBrains Mono Nerd Font 10
			    position = 0, 0
			    halign = center
			    valign = center
			}
		'';
	};
}
