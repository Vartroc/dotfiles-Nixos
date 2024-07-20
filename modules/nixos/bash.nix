{ config, lib, ... }:
{
options.bash = {
	aliases.enable = lib.mkEnableOption "Bash Aliases";
};
config = lib.mkIf config.bash.aliases.enable {
	programs.bash.shellAliases = {
  		l = "ls -alh";
		ll = "ls -l";
  		ls = "ls --color=tty";
  		rebuild = "/etc/nixos/modules/scripts/rebuild.sh";
  		configurate = "sudo nvim /etc/nixos/hosts/Gartroc/configuration.nix";
	};
};
}
