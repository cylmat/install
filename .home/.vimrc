""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
" - https://github.com/amix/vimrc
" - https://github.com/javiersalcedopuyo/DOT-Files/blob/master/init.vim
"
""""""""""""""""""
" Plugins
" - https://dev.to/javiersalcedopuyo/turn-vim-into-a-comfy-and-modern-editor-with-these-plugins-53k3
" - https://vimawesome.com
" - https://github.com/ibnYusrat/vimcode (vim like Vscode)
" 
" VIMPLUG : Lightweight plugin manager
" - https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" - https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" The default plugin directory will be as follows:
" - Vim (Linux/macOS): '~/.vim/plugged'
"
" Load plugins:
" :source %
"
""""""""""""""""""
" - see also:

""" quickfix
" romainl/vim-qf: Tame the quickfix window
" stefandtw/quickfix-reflector.vim: Change code right in the quickfix window

""" navigation
" rhysd/clever-f.vim: use fff instead of f;;
" unblevable/quick-scope: fast left-right movement

""" tabs & status
" powerline/powerline
" tpope/vim-flagship: Configurable and extensible tab line and status line 

""" tools
" ctrlpvim/ctrlp.vim: Fuzzy file, buffer, mru, tag, etc finder
" mhinz/vim-signify (git gutter alternative)
" skim-rs/skim (fzf)
" tomtom/tcomment_vim
" tpope/vim-speeddating
" vim-test/vim-test

""" useful
" vim-ctrlspace/vim-ctrlspace " control spaces

""" focus
" junegunn/goyo.vim: Distraction-free writing in Vim
" junegunn/limelight.vim: Hyperfocus-writing in Vim

""" https://github.com/neoclide/coc.nvim
""" https://github.com/prabirshrestha/vim-lsp
" autocompletion engine for Vim8 & Neovim, full language server protocol support as VS Code
" uncomment for right version with Vim and Node

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Tagbar: <Tags> outline viewer
" :TagbarToggle
" must install ctags
" sudo apt install exuberant-ctags   (or universal-ctags)
" brew install ctags  (or universal-ctags/universal-ctags/universal-ctags)
" -get some error when using NerdTree autoclose-

" Plug 'majutsushi/tagbar'

""" Multi-cursor
" Plug 'mg979/vim-visual-multi'

"""
" andymass/vim-matchup
" craigemery/vim-autotag
" jlanzarotta/bufexplorer
" dominikduda/vim_current_word
" jremmen/vim-ripgrep'
" junegunn/vim-easy-align
" justinmk/vim-dirvish
" kshenoy/vim-signature
" liuchengxu/vista.vim
" ludovicchabant/vim-gutentags
" luochen1990/rainbow
" tpope/vim-abolish
" mattn/emmet-vim
" preservim/nerdcommenter

"""""""""""""""""""""""""""""""""""""""""""""" config




""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" CORE INIT.vim """""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""

" @ref:
" - https://vim.fandom.com/wiki/Example_vimrc
" - https://github.com/wellbredgrapefruit/vim_config

" Reset to vim-defaults, ward off unexpected things 
" Avoid legacy vi mode
if &compatible
  set nocompatible 
endif

set encoding=utf8
set ffs=unix,dos

filetype plugin indent on
set backspace=indent,eol,start


"""  PERFORMANCE

" lazyredraw - lz Don't redraw while executing macros
" ttyfast - Blast output as fast as possible.
set lazyredraw
set ttyfast

""""" BASIC SETTINGS """""
" errorbells - eb Ring the bell (beep or screen flash) for error messages.
" hidden    : (hidden or active) switch buffers without saving (You can :e otherfile without :w)
" nocursorcolumn: CursorColumn highlights the entire vertical column under the cursor. (noisy)
" selectmode: Mouse selection enter in VISUAL mode
" showcmd   : sc Shows partial commands while typing
" signcolumn: Always show the sign column (Prevents text from shifting.)
" splitbelow: Horizontal splits open below the current window. (:split)
" splitright: Vertical splits open to the right. (:vsplit)
" shortmess : Makes completion less noisy.
" updatetime: Faster diagnostics
" visualbell - vb Use visual bell instead of beeping when doing something wrong
" wildmenu  : interactive tab completion for ":" commands.
" wildmode  : Controls how command completion behaves.
" wrap      : Long lines stay on multi lines (no wrap: stay on one long line)
set noeb
set hidden
set nocursorcolumn
set selectmode+=mouse
set shortmess+=c
set showcmd
set signcolumn=yes
set splitbelow
set splitright
set updatetime=200
set wildmenu
set wildmode=longest:full,full
set visualbell
set wrap


" -- statusbar --
" laststatus: 2 'always' display lightbar (pure vim no bar: laststatus=0)
" noshowmode: do not show insert, visual.. (not useful if already in status bar)
"     " since airline already shows it
" showtabline: 1: show tabbar if more than one tabs, 2: always
set laststatus=2 
set noshowmode 
set showtabline=1

 " Better yank/paste (doesn't works without +clipboard support, e.g. in WSL)
" set clipboard+=unnamedplus
" mouse=a: enable mouse in all modes (normal, visual, insert, command-line)
set mouse=a 


""" navigation

" number          : show absolute line numbers
" relativenumber  - rnu Display line numbers on the left
" ruler           : show cursor position in status bar
" scrolloff=8     : Keep 8 lines visible above and below the cursor
" sidescrolloff=8 : Keeps 8 columns visible when scrolling sideways
set number
set relativenumber
set ruler
set scrolloff=8
set sidescrolloff=8


""" edition """

" ignorecase - ic Ignore case when searching
" incsearch  - is incremental search, show matches as typing
" showmatch  - sm When a bracket is inserted, briefly jump to the matching one.
" smartcase  - scs smart searching
set ignorecase
set incsearch
set showmatch
set smartcase


""" indent  """

" expandtab  - When you press <Tab>, insert spaces instead of a real tab.
" shiftwidth - One “indent level” = 4 spaces. Used by: >> / << = auto-format
" tabstop    - ts <Tab> is visually displayed as 4 spaces
" smarttab   - <Tab> behaves differently at start of line vs mid-line
"             At line start → use shiftwidth. In middle of line → use tabstop
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4

" autoindent - ai
" smartindent- si
" wrap       - wrap lines longer than window width
set autoindent
set smartindent


""" magic

" https://vim.fandom.com/wiki/Simplifying_regular_expressions_using_magic_and_no-magic
" - Use of "\m" makes the pattern after it be interpreted as if 'magic' is set (like grep)
" - After very "\v", all ASCII chars except '09','az','AZ','_' has special meaning (egrep)
set magic

""" other
" hid backspace=eol,start,indent whichwrap+=<,>,h,l



""""""""""""""""""""""""""""
"""""" color & themes """"""
""""""""""""""""""""""""""""

" syntax : Enable syntax highlighting
syntax on

" background=dark (or light)
" hlsearch   - hls Highlight searches (use <C-L> to temporarily turn off highlighting
" nocursorline - don't highlight the whole line of the cursor (too noisy)
" termguicolors - mandatory! enable 24-bit true RGB color in the TUI 
set background=dark
set hlsearch
set nocursorline
set termguicolors

" theme (build-in: evening, elflord, industry, murphy, pablo, peachpuff, ron, shine, slate, torte)
" switch with :colorscheme {name}
" classic-modern: gruvbox (Plug 'morhetz/gruvbox')
" VS Code vibes: dracula or tokyonight (Plug 'folke/tokyonight.nvim')
" minimal pro: nord (Plug 'arcticicestudio/nord-vim') or solarized (Plug 'altercation/vim-colors-solarized')
" (Plug 'joshdick/onedark.vim') / (Plug 'joshdick/onedark.vim')
" colorscheme evening

""" EVENING override
highlight Comment guifg=#777777
highlight CursorLine guibg=#262626
highlight CursorLineNr guifg=#FFD700 gui=bold
highlight IncSearch guibg=#555555 guifg=NONE
highlight LineNr guifg=#666666
highlight MatchParen guibg=#3a3a3a guifg=#ffffff gui=bold
highlight NormalNC guibg=#181818
highlight Search guibg=#444444 guifg=NONE
highlight SignColumn guibg=#1e1e1e
highlight VertSplit guifg=#333333 guibg=#1e1e1e
highlight Visual guibg=#333333

" Darker background
highlight EndOfBuffer guibg=#1e1e1e
highlight NonText guibg=#1e1e1e
highlight Normal guibg=#1e1e1e ctermbg=NONE
"""

" color comments
" highlight Comment ctermfg=DarkGray guifg=#777777

" Make current line number pop
" highlight CursorLineNr ctermfg=Yellow guifg=#FFD700

" hightlight search colors
" highlight Search guibg=#444444 guifg=NONE

" for transparent background (e.g. for Alacritty)
" highlight Normal guibg=NONE ctermbg=NONE





""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
""""""""""" PLUGINS (vim-plug) """""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""

""" Install VimPlug """
" mkdir -p ~/.vim/autoload/plug.vim && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

""" Install plugins with vim-plug
" PlugClean - Remove plugins not listed in the vimrc
" PlugInstall - Install plugins
" PlugUpdate  - Update plugins


" call plug#begin('~/.vim/plugged')
call plug#begin()


"""""""""""""""""""""
""" CONFIGURATION """
"""""""""""""""""""""

""" Sensible
" One step above 'nocompatible' mode (minimal “good defaults” set)
" runtime! plugin/sensible.vim (if manually) make it load earlier, so we can override config
" a universal set of defaults that (hopefully) everyone can agree on.
" ex: nocompatible , filetype plugin indent on, backspace=indent,eol,start, matchit.vim etc..
Plug 'tpope/vim-sensible'


""""""""""""""""""""""""
""" COLORS & STATUS """"
""""""""""""""""""""""""

""" Airline (heavy but fancy)
" Lean & mean status/tabline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

  " or "

""" Lightline (lightweight bar)
" "A light and configurable statusline/tabline
" set laststatus=2 " always display status bar
" set noshowmode " remove double information bar
Plug 'itchyny/lightline.vim'

""" DevIcons for files
" for lightline, startify, nerdtree..
" :help devicons
Plug 'ryanoasis/vim-devicons'

""" Startify
" The fancy start screen for Vim
" ONLY SHOW ON ENTER "vim", not when opening a file "vim file.txt"
Plug 'mhinz/vim-startify'


  " themes "

""" solarized theme
" Precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

""" tokyo night theme
Plug 'ghifarit53/tokyonight-vim'

""" vimcode dark
Plug 'tomasiser/vim-code-dark'



"""""""""""""""""""""""""
""" TOOLS & EXPLORER """"
"""""""""""""""""""""""""

""" NERDTree
" :help NERDTree
" :NERDTree
" File explorer (shortcutted as Ctrl+B)
"
" additional plugins
" Xuyuanp/nerdtree-git-plugin: Shows Git status flags for files and folders in NERDTree.
" ryanoasis/vim-devicons: Adds filetype-specific icons to NERDTree files and folders.
" tiagofumo/vim-nerdtree-syntax-highlight: Adds syntax highlighting to NERDTree based on filetype.
" scrooloose/nerdtree-project-plugin: Saves and restores the state of the NERDTree between sessions.
" PhilRunninger/nerdtree-buffer-ops: 1) Highlights open files in a different color. 2) Closes a buffer directly from NERDTree.
" PhilRunninger/nerdtree-visual-selection: Enables NERDTree to open, delete, move, or copy multiple Visually-selected files at once.

Plug 'preservim/nerdtree'


""" Fzf : A command-line fuzzy finder
" brew install  fzf
" brew install fzf bat ripgrep the_silver_searcher perl universal-ctags
"
" For syntax-highlighted preview, install bat
" If delta is available, GF?, Commits and BCommits will use it to format git diff output.
" Ag requires The Silver Searcher (ag)
" Rg requires ripgrep (rg)
" Tags and Helptags require Perl
" CTRL-T / CTRL-X / CTRL-V to open in new tab, split or vsplit
" use lazy load with Plug 'junegunn/fzf.vim', { 'on': ['Files', 'GFiles', 'Buffers'] }
"
" usage: :Files, :GFiles, :Buffers, :Colors, :Lines, :BLines, :Tags, :Helptags, :BTags, :Commands, :Locate PATTERN
"        :Changes, :Marks, :BMarks, :Jumps, :Windows, :Snippets, :Filetypes, :Maps, :History:, :History?, :Rg, :Ag

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""" Ripgrep
" brew install ripgrep
" rg <pattern> is like grep -R -E <pattern> but faster
" use :Rg <string|pattern>

Plug 'jremmen/vim-ripgrep'

""" Vim Project
" manage projects and sessions.
" :Project <path>
" :ProjectNew <path>
" :ProjectList
Plug 'leafOfTree/vim-project'

""" Buffet
" add a nice top tabline with open buffers, like an IDE
" vim buffet recommendation
" Bw[!] - close all buffers except the current one, with or without saving
"
" noremap <Tab> :bn<CR>
" noremap <S-Tab> :bp<CR>
" noremap <Leader><Tab> :Bw<CR>
" noremap <Leader><S-Tab> :Bw!<CR>
" noremap <C-t> :tabnew split<CR>

Plug 'bagrat/vim-buffet'

""" Which key
" Leader key hints after timeout (e.g. after pressing <Leader>)
" vim-which-key requires option timeout is on, see :h timeout.
" just configure nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

Plug 'liuchengxu/vim-which-key'


"""""""""""""""""""
""" NAVIGATION """"
"""""""""""""""""""

""" EasyMotion 
" default leader is '\'
" :let mapleader=" "
" :echo mapleader
" e.g.: <Leader><Leader>fo

Plug 'easymotion/vim-easymotion'

""" Matchit
" extended % matching for HTML, if/else, try/catch etc..

Plug 'adelarsq/vim-matchit'


""" Repeat.vim
" works with surround.vim and unimpaired.vim
" enable repeating supported plugin maps with "."

Plug 'tpope/vim-repeat'

""" Sneak
" Use s{char}{char} or s{char}{Enter}
" Copy, delete, yank... <cdy>z{char}{char}

Plug 'justinmk/vim-sneak'


""" vim-bookmarks, harpoon -like style
" Jump between marked files like tabs on steroids
" For your style (fzf + git + big configs), this is gold:
" mm 	:BookmarkToggle
" mi 	:BookmarkAnnotate <TEXT>
" mn 	:BookmarkNext
" mp 	:BookmarkPrev
" ma 	:BookmarkShowAll
" mc 	:BookmarkClear
" mx 	:BookmarkClearAll
" [count]mkk 	:BookmarkMoveUp [<COUNT>]
" [count]mjj 	:BookmarkMoveDown [<COUNT>]
" [count]mg 	:BookmarkMoveToLine <LINE>
" :BookmarkSave <FILE_PATH>
" :BookmarkLoad <FILE_PATH>

Plug 'MattesGroeger/vim-bookmarks'


"""""""""""""""
""" CODING """"
"""""""""""""""


""" Comment toggle (gcc)
" gcc to comment out a line (takes a count)
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph)
" gc in visual mode to comment out the selection
" gc in operator pending mode to target a comment. 
" :7,17Commentary
" :global invocation like with :g/TODO/Commentary

Plug 'tpope/vim-commentary'


""" Surround https://github.com/tpope/vim-surround
" USE cs"'

Plug 'tpope/vim-surround'

""" Unimpaired: https://tpope.io/vim/unimpaired.git
" :help unimpaired
" :help unimpaired-mappings
" :map [, :map [b, etc..
" most used:
" [b, ]b (prev/next buffer),   [q, (prev quickfix), [c, (prev change)
" [a, ]a (prev/next argument), [d, (prev diff),     [f, (prev file)
" [t, ]t (prev/next tab),      [s, (prev search),   [l, (prev location)
" [e, ]e (swap line up/down),  [p, ]p (paste above/below)

Plug 'tpope/vim-unimpaired'

""" peekaboo
" see the registers content
" extends " and @ in normal mode and <CTRL-R> in insert mode
" so you can see the contents of the registers.
Plug 'junegunn/vim-peekaboo' 


"""""""""""""""""""
""""" USEFUL """"""
"""""""""""""""""""

""" vim ai
" bring the power of OpenAI's language models to Vim

" Plug 'madox2/vim-ai'

""" Git Fugitive.vim
" A Git wrapper so awesome
" use with Git (optional, VS Code Source Control vibe)
" :Git blame  <> Enter → opens the exact commit, = → diff that commit, o → open in new split
" :Gdiffsplit <> left: index / HEAD, right: working tree
" :Git        <> - stages/unstages a file, cc commits, dv vertical diff, = inline diff
" etc..

Plug 'tpope/vim-fugitive'

""" git gutter
" Shows git diff in the sign column

Plug 'airblade/vim-gitgutter'


"""""""""""""""""""""""""
""" Language support """"
"""""""""""""""""""""""""

""" syntax checking
" Plug 'dense-analysis/ale'

""" A collection of language packs for Vim.
" Plug 'sheerun/vim-polyglot'


call plug#end()





""""""""""""""""""""""
"""  PLUGIN CONFIG """
" """"""""""""""""""""


""" ---- Airline ----
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

""" ---- GitGutter ----
set updatetime=250

""" ------ fzf -------
" open every command swith Fzf prefix, e.g. :FzfFiles, :FzfBuffers...
" :echo g:fzf_vim.command_prefix
let g:fzf_command_prefix = 'Fzf'

""" ---- NERDTree ----
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1

""" ---- ripgrep -----
" Use ripgrep for :grep, only current directory
" set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --max-depth\ 1

""" ------tagbar -----
" automatic open tagbar for these languages
" autocmd FileType js,java,php,python,ts TagbarOpen
" can Prevent Tagbar from closing itself automatically
" let g:tagbar_close_auto = 0

""" ----- theme tokyo night -----
" available: night, storm
let g:tokyonight_style = 'night' 
let g:tokyonight_enable_italic = 1

""" -----vim ai -----
" !set file is chmod 600
let g:vim_ai_token_file_path = '~/.config/openai.token'

""" ---- Visual Multi (Ctrl+D) ----
let g:VM_maps = {}
let g:VM_maps["Find Under"] = "<C-d>"
let g:VM_maps["Find Subword Under"] = "<C-d>"

""" ----vim-buffet
let g:buffet_use_devicons = 1    " optional: show file icons
let g:buffet_show_modified = 1   " show if buffer is modified
let g:buffet_show_tab_number = 1 " show tab number in the tabline (default: 1)


" Automatically update the tabline
set laststatus=2

""" --- which key popup
highlight WhichKeyFloat      guifg=#d4d4d4 guibg=#1e1e1e
highlight WhichKeyFloating   guifg=#d4d4d4 guibg=#1e1e1e
highlight WhichKeyGroup      guifg=#569CD6 guibg=#1e1e1e gui=bold
highlight WhichKeyDesc       guifg=#9CDCFE guibg=#1e1e1e
highlight WhichKeySeperator  guifg=#C586C0 guibg=#1e1e1e gui=bold
highlight WhichKeyKey        guifg=#DCDCAA guibg=#1e1e1e gui=bold
highlight WhichKeyPending    guifg=#CE9178 guibg=#1e1e1e gui=bold
highlight WhichKeySel        guifg=#ffffff guibg=#3c3c3c  gui=bold




""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" KEYMAPS """""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
" Recursive mapping (map, imap, etc.) allows the mapped keys to trigger other mappings.
" Always prefer *noremap unless you specifically want recursion.
" n → Normal mode
" i → Insert mode
" v → Visual mode
" x → Visual block mode
" c → Command-line mode
" t → Terminal mode
" see all mappings with :map, :nmap, :imap, :vmap, etc.

" !!! CAUTION !!!
" Why <C-Tab> / <C-S-Tab> don’t work
" Ctrl+Tab and Ctrl+Shift+Tab are not standard keycodes in terminals.
" Terminal apps like Alacritty, iTerm2, Gnome Terminal, or Windows Terminal may not even send any escape sequence for these combinations.

" Use Alt + arrow keys
" Alt usually works in most terminals if your terminal sends the proper escape sequences:

" !!! Capital letters are treated as SHIFT !!!
" so <leader>F equals <leader+Shift>f

" --- or let mapleader="\<Space>"
" must be first defined
" define Space as Leader
let mapleader = " "

" "localleader" is for plugins to use, it’s not used by Vim itself.
" It’s a second leader key that plugins can use for their own mappings,
" so they don’t conflict with your main leader key.
" By default, localleader is set to \
" Map the localleader (for Insert -ode mappings)
" let maplocalleader = "\"

""""""""""""""""""""
""""" PLUGINS """"""
""""""""""""""""""""


""" ---- Git 

nnoremap <leader>g :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gb :Git blame<CR>


""" ----- vim-ai 

" stop async chat generation
nnoremap <leader>ais :AIStopChat<CR>

" complete text on the current line or in visual selection
nnoremap <leader>aia :AI<CR>
xnoremap <leader>aia :AI<CR>

" edit text with a custom prompt
" xnoremap <leader>aif :AIEdit fix grammar and spelling<CR>
" nnoremap <leader>aif :AIEdit fix grammar and spelling<CR>

" trigger chat
xnoremap <leader>aic :AIChat<CR>
nnoremap <leader>aic :AIChat<CR>

" redo last AI command
nnoremap <leader>air :AIRedo<CR>


""" ----- vim impaired 

" configure unimpaired mappings with < and > as the prefix
nmap < [
nmap > ]
omap < [
omap > ]
xmap < [
xmap > ]


""" ---- vim-which-key plugin
" Without <silent>: Vim would echo :WhichKey 'g' in the command line.
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> [ :WhichKey '['<CR>
nnoremap <silent> ] :WhichKey ']'<CR>



"""""""""""""""""""
""""" CUSTOM """"""
"""""""""""""""""""

" ------- helper ------

" Escape in insert mode
inoremap qq <Esc>

" Clear search 
nnoremap <leader>c :nohlsearch<CR>

" Close  window
nnoremap <leader>q :wqall<CR>

" Faster Window navigation 
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

""" --- BUFFERS

" new workspace
nnoremap <leader>bw :enew<CR>

" next / prev workspace
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" close workspace
nnoremap <leader>bd :bdelete<CR>

" List all buffers and pick one visually
nnoremap <leader>bb :FzfBuffers<CR>

""" buffer helpers

" Close current buffer but keep the window open (uncomment if needed)
" nnoremap <leader>bd :bp<BAR>bd#<CR>

" Save all buffers
" nnoremap <leader>wa :wa<CR>



""" --- TABS

" new workspace
nnoremap <leader>tw :tabnew<CR>

" next / prev workspace
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" close workspace
nnoremap <leader>tc :tabclose<CR>

""" --- SPLITS

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Resize splits
nnoremap <leader><Left>  :vertical resize -5<CR>
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Up>    :resize +3<CR>
nnoremap <leader><Down>  :resize -3<CR>

""" --- search vim fzf

nnoremap <leader>ff :FzfFiles<CR>
nnoremap <leader>fg :FzfRg<CR>


" ------- behavior ------

" Keep selection when indenting
vnoremap < <gv
vnoremap > >gv

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" ------- Open cheat sheet ------
nnoremap <leader>cht :tabnew ~/.vim.cheat <CR>




"""""" ===================== """"""
"""""" VS CODE–LIKE KEYBINDS """"""
"""""" ===================== """"""

" !!! <C-Tab> / <C-S-Tab> / <A-Tab>... usually don’t work in terminal Vim !!!


""""""""""""""""""""""""
""" TOOLS & EXPLORER """
""""""""""""""""""""""""

" Ctrl+b → Toggle file explorer
" nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>b :NERDTreeToggle<CR>

" Normal mode: Ctrl+Shift+E focuses NERDTree
" go back to previous window with <Ctrl-W>p
" nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <leader>E :NERDTreeFocus<CR>


" Toggle Tagbar
" - DON'T USE IT CAUSE ERROR ON CLOSING
" - let TagBar manage itself on files
" nnoremap <F8> :TagbarToggle<CR>

""" Vim fzf
" Ctrl+p → Quick FZF open file
" nnoremap <leader>p :Files<CR>
nnoremap <leader>p :FzfFiles<CR>

""" Command palette
nnoremap <leader>P :FzfCommands<CR>


" Leader+Shift+F → Search in files (with ripgrep)
nnoremap <leader>F :FzfRg<CR>

""" terminal
nnoremap <leader>ù :term<CR>


""""""""""""""
""" coding """
""""""""""""""

" Ctrl+S → Save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a


""" Tpope/vim-commentary
" Ctrl+/ → Toggle comment (DOESN'T WORKS ON MOST TERMINALS, e.g. Alacritty)
" use Leader instead for now, or remap to something else
nnoremap <leader>: :Commentary<CR>
vnoremap <leader>: :Commentary<CR>

" Insert mode: de-indent current line
inoremap <S-Tab> <Esc><<i

" " Visual mode: indent / de-indent selection and stay in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv



""""""""""""""""""
""" navigation """
""""""""""""""""""

""" Tabs 
" VSCODE display Tabs
" Vim use buffers

" 1gt   " go to tab 1
" 2gt   " go to tab 2
" 3gt   " go to tab 3
nnoremap <leader>& 1gt<CR>
nnoremap <leader>é 2gt<CR>
nnoremap <leader>" 3gt<CR>
nnoremap <leader>' 4gt<CR>
nnoremap <leader>( 5gt<CR>
nnoremap <leader>- 6gt<CR>
nnoremap <leader>è 7gt<CR>
nnoremap <leader>_ 8gt<CR>
nnoremap <leader>ç 9gt<CR>
nnoremap <leader>à 10gt<CR>


""" Buffers
" Ctrl+Tab → Next buffer
" Ctrl+Shift+Tab → Previous buffer
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>


""" Move lines
" Alt+Up / Alt+Down → Move line

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up>   :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up>   <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up>   :m '<-2<CR>gv=gv




" -------------------------------
" ------ COMMANDS ---------------
" -------------------------------


" Start NERDTree and put the cursor back in the other window.
" :wincmd p (back to previous window)
" autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if exists(":NERDTree") | NERDTree | wincmd p | endif


" Automatically close Vim if NERDTree is the last window
" BufEnter * → runs on every buffer switch
" winnr('$') == 1 → checks if this is the only window left
" &filetype == 'nerdtree' → only triggers if it’s the NERDTree buffer
autocmd BufEnter * try | if winnr('$') == 1 && bufname('%') =~ 'NERD_tree_'  | quit | endif | catch | endtry

" autocmd WinEnter *
"   \ try | if winnr('$') == 1 && bufname('%') =~ 'NERD_tree_' |
"   \ call timer_start(10, { -> execute('quit') }) |
"   \ endif | catch | endtry


" Safe auto-close NERDTree + buffers

" 1️⃣ Close NERDTree if it's the last window
" autocmd BufEnter * if winnr('$') == 1 && &filetype ==# 'nerdtree' | quit | endif

" 2️⃣ Close all other buffers when exiting, but prompt to save
" function! s:SafeQuitAll()
"   " Get a list of modified buffers
"   let l:modified = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&mod")')
"   if !empty(l:modified)
"     " Prompt user if any unsaved buffers exist
"     echohl WarningMsg
"     echo "You have unsaved buffers. Use :wqall to save all, or :qall! to discard."
"     echohl None
"     return
"   endif
"   " No unsaved buffers, safe to quit all
"   qall
" endfunction

" autocmd VimLeavePre * call s:SafeQuitAll()

""" 
" sample: how to load plugin
" augroup Startify
"   autocmd!
"   autocmd VimEnter * call timer_start(50, {-> execute('Startify')})
" augroup END


if filereadable(expand('~/.vim/.custom.vim'))
  source ~/.vim/.custom.vim
endif


if filereadable(expand('~/.vim/.override.vim'))
  source ~/.vim/.override.vim
endif

