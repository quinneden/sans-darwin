{
  programs.git = {
    enable = true;

    settings = {
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = "quinneden";
      push.autoSetupRemote = true;
      user.email = "quinn@qeden.dev";
      user.name = "Quinn Edenfield";
    };
  };

  programs.ssh = {
    enable = true;
    matchBlocks."*" = {
      addKeysToAgent = "yes";
    };
  };

  services.ssh-agent.enable = true;
}
