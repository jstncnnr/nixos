{ pkgs, ... }:

{
  programs.waybar.enable = true;
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      height = 42;
      spacing = 0;
      modules-left = ["hyprland/workspaces" "hyprland/submap"];
      modules-right = ["tray" "pulseaudio" "clock" "custom/power"];
      
      "hyprland/workspaces" = {
	all-outputs = true;
	format = "{icon}";
	on-click = "activate";
	format-icons = {
	  "1" = "";
	  "2" = "";
	  "3" = "";
	  "4" = "";
	  "5" = "";
	  "6" = "";
	};
	persistent-workspaces = {
	  "*" = 6;
	};
      };

      "hyprland/window" = {
	max-length = 200;
      };

      "hyprland/submap" = {
	format = "<span style=\"italic\">{}</span>";
      };

      "tray" = {
	icon-size = 16;
	spacing = 8;
      };

      "clock" = {
	format = "{:%I:%M %p}";
	format-alt = "{:%m-%d-%Y}";
	tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      "pulseaudio" = {
	reverse-scrolling = 1;
	format = "{icon} {volume}%  {format_source}";
        format-bluetooth = "{icon} {volume}%  {format_source}";
        format-bluetooth-muted = " {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
        };
        on-click = "pavucontrol";
	min-length = 13;
	ignored-sinks = ["Office" "Justin's MacBook Pro"];
      };

      "custom/power" = {
	format = "";
	on-click = "~/.config/waybar/scripts/powermenu.sh";
	tooltip = false;
      };
    };
  };
  programs.waybar.style = ''
    * {
	font-family: MesloLGS NF, sans-serif;
	font-size: 14px;
    }

    window#waybar {
	background: transparent;
    }

    window#waybar.hidden {
	opacity: 0.2;
    }

    #window {
	background: #3b4252;
	border-radius: 10px;
	margin-top: 8px;
	margin-left: 8px;
	padding: 0px 8px;
	color: #7c818c;
    }

    #workspaces {
	background: #3b4252;
	border-radius: 10px;
	margin-top: 8px;
	margin-left: 8px;
	font-size: 18px;
    }

    #workspaces * {
	font-size: 18px;
    }

    #workspaces button {
	transition: none;
	color: #7c818c;
	background: transparent;
	padding: 4px 8px;
	border-radius: 0;
	font-size: 18px;
    }

    #workspaces button:hover {
	transition: none;
	box-shadow: inherit;
	text-shadow: inherit;
	border-radius: inherit;
	border: none;
	background: #4c566a;
    }

    #workspaces button.persistent:not(.empty):not(.active) {
	color: #eceff4;
    }

    #workspaces button.empty {
	color: #7c818c;
    }

    #workspaces button.active {
	color: #ebcb8b;
	background: #434c5e;
	border-radius: inherit;
    }

    #workspaces button.urgent {
	color: #bf616a;
    }

    #submap,
    #clock,
    #pulseaudio,
    #custom-swaync,
    #custom-power,
    #custom-bluetooth,
    #upower,
    #tray {
	background: #3b4252;
	border-radius: 10px;
	margin-top: 8px;
	margin-left: 8px;
	padding: 4px 12px;
	color: #fff;
    }

    #clock {
	padding-top: 4px;
	padding-bottom: 4px;
	border-radius: 10px 0px 0px 10px;
	margin-right: 0px;
    }

    #custom-swaync {
	font-size: 18px;
	border-radius: 0px;
	margin-left: 0px;
	padding-left: 4px;
    }

    #custom-bluetooth {
	border-radius: 0px;
	margin-left: 0px;
	padding-left: 4px;
    }

    #custom-power {
	border-radius: 0px 10px 10px 0px;
	margin-left: 0px;
	padding-left: 4px;
	font-size: 18px;
    }

    #upower {
	font-size: 18px;
    }

    #upower.charging {
	color: #A3BE8C;
    }

    #pulseaudio.muted {
	color: #bf616a;
    }

    .modules-right:last-child {
	margin-right: 8px;
    }

    @keyframes blink {
	to {
	    background-color: #ffffff;
	    color: #000000;
	}
    }
  '';
}
