{ config, pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  programs.vscode = {

    enable = true;

  };

  programs.git = {
    enable = true;
    userName = "Moh. Yusril Maqoshidana";
    userEmail = "yusrilkingsr07@gmail.com";
    ignores = [ 
      # Flutter/Dart ignores
      ".dart_tool/ls
flake.lock  flake.nix  module/  users/"
      ".flutter-plugins"
      ".flutter-plugins-dependencies"
      ".packages"
      "build/"
      "ios/Pods/"
      
      # Android ignores
      "*.apk"
      "*.dex"
      "*.class"
      ".gradle/"
      "local.properties"
      "captures/"
      ".externalNativeBuild/"
      ".cxx/"
    ];
  };

  # Configurasi BAT
  programs.bat = {
   enable= true;
   config = {
     pager = "less -FR";
     theme = "Dracula";
   };
  };
 
  # Configure fish
  programs.fish = {
   enable = true;
   shellAbbrs = {
     cp = "cp -iv";
     mv = "mv iv";
     rm = "trash-put";
     cat = "bat";
     gst = "git status";
     gco = "git checkout";
     gcm = "git commit -m";
     ga = "git add";
   }; 
  };
  
 # Configure startship
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  #Configure zoxide
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  #Configure tmux 
  programs.tmux = {
    enable = true;
    mouse = true;
    shortcut = "a";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      pain-control
      yank
      prefix-highlight
    ];
  };

  #Configure Neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
       neovim-sensible
       nvim-surround
       nvim-treesitter
       nvim-cmp
       vim-airline
       {
          plugin = vim-airline-themes;
          config = ''
            let g:airline_theme='wombat'
          '';
       }
       vim-airline-clock
       vim-commentary
       vim-fugitive
       vim-gitgutter
       vim-indent-guides
       {
          plugin = dracula-nvim;
          config = ''
            syntax enable
            colorscheme dracula
          '';
       }
    ];
    extraConfig = ''
      set cursorline
      set scrolloff=5
    '';
  };


 
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
