{ inputs, pkgs, ...}: {

  imports = [ inputs.zen-browser.homeManagerModules.zen-browser ];

  home.file.".zen/luna/chrome".source = ./chrome;
  home.file.".zen/luna/zen-keyboard-shortcuts.json".source = ./zen-keyboard-shortcuts.json;

  programs.zen-browser = {
    enable = true;
    profiles = {
      luna = {
        id = 0;
        name = "Luna";
        isDefault = true;

        search = {
          force = true;
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          order = [ "DuckDuckGo" ];
          engines = {
            "Bing".metaData.hidden = true;
          };
        };

        settings = {
          "theme.no_gaps.split.gaps" = false;
          "theme.no_gaps.split.rounded_corners" = false;

          "theme.no_gaps.single_toolbar.disable_navbar" = true;
          "theme.no_gaps.split.single_toolbar.disable_navbar" = true;
        };

        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          privacy-badger
          indie-wiki-buddy
          pronoundb
          return-youtube-dislikes
          shinigami-eyes
          stylus
          translate-web-pages
          web-archives
          keepassxc-browser
        ];
      };
    };
  };
}
