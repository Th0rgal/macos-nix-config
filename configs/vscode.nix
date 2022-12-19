{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = (with pkgs.vscode-extensions; [ brettm12345.nixfmt-vscode ]);

    userSettings = {
      update.mode = "none";
      window = {
        zoomLevel = 0;
        autoDetectColorScheme = true;
        menuBarVisibility = "toggle";
      };

      terminal.integrated = {
        defaultProfile.osx = "bash";
        profiles.osx = {
          zsh = {
            path = "zsh";
            args = [ "-l" ];
          };
        };
      };

      editor = {
        fontFamily =
          "'JetBrainsMono Nerd Font Mono', 'monospace', monospace, 'Droid Sans Fallback'";
        fontSize = 13.5;
        fontLigatures = true;
        inlineSuggest.enabled = true;
        minimap.enabled = false;
        bracketPairColorization.enabled = true;
        stickyScroll.enabled = true;
      };

      workbench = {
        iconTheme = "material-icon-theme";
        colorTheme = "GitHub Dark"; # Material Theme Ocean High Contrast
        preferredDarkColorTheme = "GitHub Dark";
        preferredLightColorTheme = "GitHub Light";
      };

      vscode-pets = {
        petSize = "medium";
        position = "explorer";
      };

      # Rust
      rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";

      # Python
      python.formatting.provider = "black";

      # Css
      "[css]" = { editor.defaultFormatter = "MikeBovenlander.formate"; };

      # Ocaml
      "[ocaml]" = { editor.defaultFormatter = "zepalmer.ocaml-indentation"; };

      # Javascript
      javascript.updateImportsOnFileMove.enabled = "always";

      # Cairo
      cairols = {
        useVenv = false;
        nileUseVenv = false;
        disableHintValidation = "./**/test_*.cairo";
        cairoPath = [
          "/Users/thomas/workspace/starknetid/naming_contract/lib/"
          "/Users/thomas/workspace/starknetid/3sbt/lib/"
        ];
      };

      extensions.ignoreRecommendations = true;
      jupyter.alwaysTrustNotebooks = true;
      files.exclude = {
        "**/.git" = true;
        "**/.svn" = true;
        "**/.hg" = true;
        "**/CVS" = true;
        "**/.DS_Store" = true;
        "**/Thumbs.db" = true;
        "**/*.olean" = true;
      };
    };
  };
}
