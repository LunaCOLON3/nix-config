{ inputs, pkgs, ...}: {
  imports = [ inputs.zen-browser.homeManagerModules.zen-browser ];

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
