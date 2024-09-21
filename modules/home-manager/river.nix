{ pkgs, lib, config, inputs, ... }:
let
  mod = "Super";
in
{

/*xdg = {
	portal = {
		enable = true;
		xdgOpenUsePortal = true;
		extraPortals = [
			pkgs.xdg-desktop-portal-gtk
		];
	};
};*/

environment.systemPackages = [ 
	pkgs.alsa-utils
	pkgs.xdg-desktop-portal-gtk
];


home-manager.users."andi" = {
wayland.windowManager.river = {
	enable = true;
	xwayland.enable = true;
	settings = {
  		map = {
    			normal = {
      				"${mod} C" = "close";
				"${mod} L" = "spawn kitty";
				"${mod} M" = "spawn firefox";

				"${mod} N" = "focus-view next";
				"${mod} R" = "focus-view previous";
			
				"${mod}+Shift N" = "swap next";
				"${mod}+Shift R" = "swap previous";

				"${mod} S" = ''send-layout-cmd rivertile "main-ratio +0.01"'';
				"${mod} B" = ''send-layout-cmd rivertile "main-ratio -0.01"'';

				"${mod}+Shift S" = ''send-layout-cmd rivertile "main-ratio +0.07"'';
				"${mod}+Shift B" = ''send-layout-cmd rivertile "main-ratio -0.07"'';
				
				# Application Starter Rofi
				"${mod} H" = ''spawn "rofi -show drun -show-icons"'';

				# Sound control, requires amixer
				"${mod} XF86AudioRaiseVolume" = ''spawn "amixer set Master 5%+"'';
				"${mod} F12" = ''spawn "amixer set Master 5%-"'';
				"${mod} F11" = ''spawn "amixer set Master toggle"'';
				
				"${mod}+Shift H" = ''spawn 'notify-send "$(date +%H):$(date +%M) Uhr"' '';	
				"${mod} W" = '' spawn 'test=$(slurp) && grim -g "$test" - | wl-copy && grim -g "$test" ~/Screenshots/"$(date)".png' '';
				"Super+Shift E" = "exit";
    			};
  		};
		focus-follows-cursor = "always";
		set-cursor-warp = "on-focus-change";
		border-color-focused = "0xb4befe";
		border-color-unfocused = "0x11111b";
		background-color = "0x1e1e2e";
		default-layout = "rivertile";
		keyboard-layout = ''"de(bone)"'';

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

		rivertile -view-padding 3 -outer-padding 3 &
		

		'';
	};
  };
}
