{ pkgs, ... }:

let unstable = import <nixpkgs-unstable> { };

in {
  programs.vscode = {
    enable = false;
    package = unstable.vscode;

    extensions = (with pkgs.vscode-extensions; [ brettm12345.nixfmt-vscode ]);

    userSettings = {
      update.mode = "none";
      window = {
        zoomLevel = 0;
        autoDetectColorScheme = true;
        menuBarVisibility = "toggle";
      };

      terminal.integrated = {
        defaultProfile.osx = "zsh";
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
        formatOnSave = true;
        codeActionsOnSave.source.organizeImports = true;
      };

      workbench = {
        iconTheme = "material-icon-theme";
        colorTheme = "GitHub Dark"; # Material Theme Ocean High Contrast
        preferredDarkColorTheme = "GitHub Dark";
        preferredLightColorTheme = "GitHub Light";
      };

      redhat.telemetry.enabled = false;

      vscode-pets = {
        petSize = "medium";
        position = "explorer";
      };

      # Rust
      rust-client.rustupPath = "${pkgs.rustup}/bin/rustup";
      rust-analyzer = {
        completion = {
          autoimport.enable = true;
          callable.snippets = "fill_arguments";
        };
        diagnostics.enable = true;
        checkOnSave.command = "clippy";
        cargo.features = "all";
      };

      # Python
      python.formatting.provider = "black";

      # Javascript
      javascript.updateImportsOnFileMove.enabled = "always";
      "[typescriptreact]" = {
        editor.defaultFormatter = "esbenp.prettier-vscode";
      };
      "[typescript]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[css]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[javascript]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[json]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[jsonc]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[html]" = { editor.defaultFormatter = "esbenp.prettier-vscode"; };
      "[python]" = { editor.defaultFormatter = "ms-python.black-formatter"; };

      cairo1.scarbPath = "/Users/thomas/.local/bin/scarb";

      # Cairo
      cairols = {
        useVenv = false;
        nileUseVenv = false;
        disableHintValidation = "./**/test_*.cairo";
        cairoPath = [
          "/Users/thomas/workspace/starknetid/naming_contract/lib/"
          "/Users/thomas/workspace/starknetid/contract/lib/cairo_contracts/src/"
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
      git.openRepositoryInParentFolders = "never";
      
      # Java
      java.configuration.runtimes = [
        {
          name = "JavaSE-21";
          path = "${pkgs.zulu}/lib/openjdk";
          default = true;
        }
      ];
    };
  };
}
