{ ... }:
{
programs.nixvim.plugins.lsp = {
  enable = true;
  servers = {
    texlab.enable = true;
    nixd.enable = true;
  };
};
}
