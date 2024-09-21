{ ... }:
{
programs.nixvim.plugins.lsp = {
  enable = true;
  servers = {
    texlab.enable = true;
    nil-ls.enable = true;
  };
};
}
