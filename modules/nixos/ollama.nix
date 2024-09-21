{ ... }:
{ services.ollama = {
  enable = true;
  loadModels = [ "mistral-nemo" ];
};
}
