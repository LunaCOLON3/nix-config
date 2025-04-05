{ ... }: {

  programs.waybar = {
    enable = true;

    style = ''
      * {
        color: @text;
        font-family: JetBrainsMonoNL Nerd Font;
      }

      window#waybar {
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }
    '';
  };

}
