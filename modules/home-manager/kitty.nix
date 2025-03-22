{ ... }: {
  
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.85";
      window_padding_width = 5;
      confirm_os_window_close = 0;
    };
    font.name = "JetBrainsMonoNL Nerd Font";
  };

}
