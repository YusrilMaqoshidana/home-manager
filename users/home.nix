{ config, pkgs, ... }:

{
  home.username = "usereal";
  home.homeDirectory = "/home/usereal";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    #Folder
    trash-cli
    
    git
    zulu17
  ];

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
       vim-airline-themes
       vim-airline-clock
       vim-commentary
       vim-fugitive
       vim-gitgutter
       vim-indent-guides
       dracula-nvim
    ];
    extraConfig = ''
	syntax enable 
	colorscheme dracula

	set cursorline
	set scrolloff=5
	let g:airline_theme='wombat'
    '';
  };
 
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
