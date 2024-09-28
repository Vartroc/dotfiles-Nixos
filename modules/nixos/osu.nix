{ inputs, ... }:
{
environment.systemPackages = [ inputs.osu.packages.x86_64-linux.osu-lazer ];
}
