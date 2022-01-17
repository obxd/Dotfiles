local o = vim.o

vim.cmd('filetype plugin on')         -- filetype detection
o.autoread = true                     -- Set to auto read when a file is changed from the outside
o.backup = false
o.clipboard = "unnamedplus"           -- Copy paste between vim and everything else
o.cmdheight = 2                       -- More space for displaying messages
o.cursorline = false                  -- Enable highlighting of the current line
o.errorbells = false                  -- no anotying beep
o.fileencoding = "utf-8"              -- Set utf8 as standard encoding
o.fileformat = "unix"                 -- unix file format
o.hidden = true                       -- keep multiple buffers open 
o.ignorecase = true
o.inccommand='split'                  -- Make substitution work in realtime
o.incsearch = true
o.magic = true
o.mouse = "a"                         -- Enebale mouse
o.number = true                      -- numbered lines
o.pumheight = 10                   -- Makes popup menu smaller
o.pumblend = 20                      -- Makes popup menu transparent
o.winblend = 20                      -- Makes window transparent
o.relativenumber = true              -- relative number
o.ruler = true                        -- Always show current position
o.shortmess = o.shortmess..'c'        -- Don't pass messages to |ins-completion-menu|.
o.showmatch = true                    -- Show matching brackets when text indicator is over them
o.showtabline = 2                     -- 0: never 1: least two tab pages 2: always
o.signcolumn = "yes"                 -- Always show the signcolumn, otherwise it would shift the text each time
o.smartcase = true
o.splitbelow = true                   -- Horizontal splits will automatically be below
o.splitright = true                   -- Vertical splits will automatically be to the right
o.swapfile = false
o.syntax = "on" 
o.termguicolors = true                -- set term gui colors most terminals support this
o.titlestring="%<%F%=%l/%L - nvim"
o.title = true
o.undodir = vim.fn.getenv("HOME") .. "/.cache/vim/undo" -- no anoying mess in folders
o.undofile = true
o.updatetime = 300                    -- refresh time
-- o.wildmenu = true                     -- Turn on the Wild menu
-- o.wildmode="longest:list:full"        -- autocompletion
o.wrap = false
o.writebackup = false
o.so = 10

-- shift and tabs:
o.autoindent=true
o.expandtab=true
o.shiftwidth=2
o.smartindent=true
o.softtabstop=2
o.tabstop=2
