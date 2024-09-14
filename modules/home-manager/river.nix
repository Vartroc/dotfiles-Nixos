{ pkgs, lib, config, inputs, ... }:
let
  mod = "Super";
 
# custom keyboard
 keyboardLayoutFile = pkgs.fetchurl {
    url = "https://dl.neo-layout.org/mine";
    sha256 = "sha256-9zx3Iei4uSUZahlBhtgsuWI0BKMbr8ukVC4PQBlqoyw="; # Replace with the actual sha256 checksum
  };
in
{

environment.systemPackages = [ 
	pkgs.alsa-utils
	pkgs.way-displays
];


home-manager.users."andi" = {
wayland.windowManager.river = {
	enable = true;
	xwayland.enable = true;
	settings = {
  		map = {
    			normal = {
      				"${mod} C" = "close";
				"${mod} I" = "spawn kitty";
				"${mod} O" = "spawn firefox";

				"${mod} J" = "focus-view next";
				"${mod} K" = "focus-view previous";
			
				"${mod}+Shift J" = "swap next";
				"${mod}+Shift K" = "swap previous";

				"${mod} L" = ''send-layout-cmd rivertile "main-ratio +0.01"'';
				"${mod} H" = ''send-layout-cmd rivertile "main-ratio -0.01"'';

				"${mod}+Shift L" = ''send-layout-cmd rivertile "main-ratio +0.07"'';
				"${mod}+Shift H" = ''send-layout-cmd rivertile "main-ratio -0.07"'';
				
				# Application Starter Rofi
				"${mod} U" = ''spawn "rofi -show drun -show-icons"'';

				# Sound control, requires amixer
				"${mod} XF86AudioRaiseVolume" = ''spawn "amixer set Master 5%+"'';
				"${mod} F12" = ''spawn "amixer set Master 5%-"'';
				"${mod} F11" = ''spawn "amixer set Master toggle"'';
				
				"${mod}+Shift U" = ''spawn 'notify-send "$(date +%H):$(date +%M) Uhr"' '';	
				"${mod} P" = '' spawn 'test=$(slurp) && grim -g "$test" - | wl-copy && grim -g "$test" ~/Screenshots/"$(date)".png' '';
				"Super+Shift E" = "exit";
    			};
  		};
		focus-follows-cursor = "always";
		set-cursor-warp = "on-focus-change";
		border-color-focused = "0xb4befe";
		border-color-unfocused = "0x11111b";
		background-color = "0x1e1e2e";
		default-layout = "rivertile";

	};

	extraConfig = ''
		for i in $(seq 1 9)
		do
    			tags=$((1 << ($i - 1)))

    			# mod+[1-9] to focus tag [0-8]
    			riverctl map normal ${mod} $i set-focused-tags $tags

    			# mod+Shift+[1-9] to tag focused view with tag [0-8]
    			riverctl map normal ${mod}+Shift $i set-view-tags $tags

    			# mod+Control+[1-9] to toggle focus of tag [0-8]
    			riverctl map normal ${mod}+Control $i toggle-focused-tags $tags
	
    			# mod+Shift+Control+[1-9] to toggle tag [0-8] of focused view
    			riverctl map normal ${mod}+Shift+Control $i toggle-view-tags $tags
		done
		  riverctl keyboard-layout de

		way-displays > /tmp/way-displays.''${XDG_VTNR}.''${USER}.log 2>&1 &	
		rivertile -view-padding 3 -outer-padding 3 &
		

		'';
	};
      home.file = {
	".config/river/mine".source = keyboardLayoutFile;
      };
  };
}
