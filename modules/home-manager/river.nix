{ pkgs, lib, config, ... }:
let
	mod = "Super";
in
{
wayland.windowManager.river = {
	enable = true;
	settings = {
  		map = {
    			normal = {
      				"${mod} C" = "close";
				"${mod} T" = "spawn kitty";
				"${mod} F" = "spawn firefox";

				"${mod} J" = "focus-view next";
				"${mod} K" = "focus-view previous";
				
				"${mod}+Shift J" = "swap next";
				"${mod}+Shift K" = "swap previous";

				"${mod}+Shift Period" = "send-to-output next";
				"${mod}+Shift Comma" = "send-to-output previous";

				"${mod} U" = ''spawn "rofi -show drun -show-icons"'';

				"${mod} XF86AudioRaiseVolume" = ''spawn "amixer set Master 5%+"'';
				"${mod} F12" = ''spawn "amixer set Master 5%-"'';

				"Super+Shift E" = "exit";
    			};
  		};
		keyboard-layout = "de";
		focus-follows-cursor = "always";
	};

	extraConfig = ''
		for i in $(seq 1 9)
		do
    			tags=$((1 << ($i - 1)))

    			# Alt+[1-9] to focus tag [0-8]
    			riverctl map normal ${mod} $i set-focused-tags $tags

    			# Alt+Shift+[1-9] to tag focused view with tag [0-8]
    			riverctl map normal ${mod}+Shift $i set-view-tags $tags

    			# Super+Control+[1-9] to toggle focus of tag [0-8]
    			riverctl map normal ${mod}+Control $i toggle-focused-tags $tags
	
    			# Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
    			riverctl map normal ${mod}+Shift+Control $i toggle-view-tags $tags
		done

		riverctl default-layout rivertile
		rivertile -view-padding 6 -outer-padding 6 &
		'';
	};
}
