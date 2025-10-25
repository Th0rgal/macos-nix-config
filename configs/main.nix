{ config, pkgs, lib, ... }:

{
  imports = [ ./vscode.nix ];

  programs = {
    git = {
      enable = true;
      userName = "Thomas Marchand";
      userEmail = "thomas.marchand" + "@" + "tuta.io";

      signing = {
        key = "1ED394859763B134";
        signByDefault = true;
      };

      extraConfig = {
        push.autoSetupRemote = true;
        init.defaultBranch = "master";
        # Git LFS configuration
        filter.lfs.clean = "git-lfs clean -- %f";
        filter.lfs.smudge = "git-lfs smudge -- %f";
        filter.lfs.process = "git-lfs filter-process";
        filter.lfs.required = true;
      };
    };

    zsh = {
      enable = true;
      initExtraFirst = ''
        # to not execute this file when running in a pure nix-shell.
        # if test -n "$IN_NIX_SHELL"; then return; fi
        [ ! -d "$HOME/.zsh/fsh/" ] && mkdir $HOME/.zsh/fsh/
        export FAST_WORK_DIR=$HOME/.zsh/fsh/;
        export PATH=$PATH:~/.foundry/bin;
        export PATH=$PATH:~/.cargo/bin;
        export PATH=$PATH:~/.nargo/bin;
        export PATH=$PATH:~/.bitcoin/bin;
        # export PATH=$PATH:~/.protostar/dist/protostar/;
        export PATH=$PATH:~/.local/bin;
        export PATH=$PATH:~/.cairo/target/release;
        # export PATH=$PATH:~/.local/share/apibara/bin;
        export PATH=$PATH:/opt/homebrew/bin;
        export PATH=$PATH:/usr/local/bin;
        export PATH=$PATH:~/.bun/bin;
        export PATH=$PATH:~/.starkli/bin;
        export PATH=$PATH:/opt/homebrew/opt/openssl@1.1/bin;
        export PATH=$PATH:~/.bun/install/global/node_modules/supabase/bin;
        # export PATH=$PATH:/Users/thomas/Library/Application\ Support/org.dfinity.dfx/bin;

        # NVM configuration
        # export NVM_DIR="$HOME/.nvm"
        # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

        alias rm="echo Use 'rip' instead of rm."
      '';
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.4";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma-continuum";
            repo = "fast-syntax-highlighting";
            rev = "v1.55";
            sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };

}
