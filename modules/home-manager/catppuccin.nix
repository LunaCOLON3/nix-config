{ inputs, ... }: {

  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "pink";

    cursors.enable = true;
  };

}
