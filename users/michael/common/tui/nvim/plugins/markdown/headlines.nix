_: {
  programs.nixvim = {
    plugins.headlines = {
      enable = true;
      settings = {
        markdown = {
          headline_highlights = [
            "Headline1"
            "Headline2"
            "Headline3"
            "Headline4"
            "Headline5"
            "Headline6"
          ];
          bullets = ["󰎤" "󰎧" "󰎪" "󰎭" "󰎱" "󰎳"];
        };
      };
    };
  };
}
