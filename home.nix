{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rose";
  home.homeDirectory = "/Users/rose";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    postgresql
    mkcert
    cabal2nix
    neovide
    tenki
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/neovide/config.toml".text = ''
      [font]
      normal = ["PragmataPro Mono Liga"]
      size = 12
      [font.features]
      "PragmataPro Mono Liga" = ["-aalt"]
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/rose/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    HOME_NIX = "/Users/rose/.config/home-manager/home.nix";
    ZSH_DISABLE_COMPFIX = "true";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  programs.ripgrep.enable = true;
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.git.enable = true;
  programs.lazygit.enable = true;
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "emacs";
    escapeTime = 0;
    extraConfig = ''
      setw -g mode-style 'fg=black bg=red bold'
      set -g pane-border-style 'fg=red'
      set -g pane-active-border-style 'fg=yellow'
      set -g status-position bottom
      set -g status-justify left
      set -g status-style 'fg=red'
      set -g status-left ""
      set -g status-left-length 10
      set -g status-right-style 'fg=black bg=yellow'
      set -g status-right '%Y-%m-%d %H:%M '
      set -g status-right-length 50
      setw -g window-status-current-style 'fg=black bg=red'
      setw -g window-status-current-format ' #I #W #F '
      setw -g window-status-style 'fg=red bg=black'
      setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '
      setw -g window-status-bell-style 'fg=yellow bg=red bold'
      set -g message-style 'fg=yellow bg=red bold'
      set -g status-position top
    '';
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = "autoload -U compinit && compinit -u";
    autocd = true;
    shellAliases = {};
    initExtra = ''
      bindkey -e
    '';
    syntaxHighlighting.enable = true;
  };
  programs.zsh.oh-my-zsh = {
    enable = true;
    theme = "nicoulaj";
  };
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    git = true;
    icons = "always";
    extraOptions = ["-F=always"];
  };
  programs.htop.enable = true;
  programs.gpg.enable = true;
  programs.fastfetch.enable = true;
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local config = wezterm.config_builder()

      config.font = wezterm.font {
        family = 'PragmataPro Mono Liga',
        harfbuzz_features = { 'calt', 'clig', 'liga', 'dlig' }
      }

      config.font_size = 12
      config.line_height = 0.9

      config.color_scheme = 'Ef-Winter'

      config.use_fancy_tab_bar = true
      config.hide_tab_bar_if_only_one_tab = true

      config.window_decorations = "TITLE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR | INTEGRATED_BUTTONS | RESIZE"

      return config
    '';
  };
}
