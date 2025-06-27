-- ==============================================================================
-- Neovim init.lua Configuration
-- This file sets up basic Neovim functionality and includes commonly desired
-- configurations, with some commented out for easy testing.
-- This version does NOT use any third-party plugins.
-- ==============================================================================

-- General Editor Options -----------------------------------------------------

-- Set Neovim options
vim.opt.encoding = "utf-8"     -- Set default encoding to UTF-8
vim.opt.fileencoding = "utf-8" -- Set file encoding to UTF-8

-- Line Numbers:
-- Display both absolute and relative line numbers.
-- Relative numbers are useful for quick navigation with motions (e.g., 5j to move down 5 lines).
-- Absolute numbers provide a constant reference.
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers

-- Transparent Background:
-- This makes the background of the Neovim editor transparent,
-- allowing your terminal's background to show through.
-- 'Normal' highlight group controls the default text and background.
-- 'EndOfBuffer' controls the '~' lines at the end of the buffer.
-- 'NonText' controls non-text areas like the space after the end of a line.
vim.api.nvim_set_option_value('termguicolors', true, {}) -- Enable true colors (24-bit RGB) in the terminal
vim.cmd('highlight Normal guibg=NONE')
vim.cmd('highlight EndOfBuffer guibg=NONE')
vim.cmd('highlight LineNr guibg=NONE')      -- Make line numbers background transparent
vim.cmd('highlight Folded guibg=NONE')      -- Make folded text background transparent
vim.cmd('highlight NonText guibg=NONE')     -- Also make non-text areas transparent
vim.cmd('highlight SpecialKey guibg=NONE')  -- Make special keys background transparent

-- Copy and Paste to System Clipboard:
-- This option enables seamless copy and paste between Neovim and your
-- system's clipboard.
-- 'unnamedplus' means that the '+' register (system clipboard) will be used
-- for all default yank and put operations.
-- Requires 'xclip' or 'xsel' on Linux, or 'pbcopy'/'pbpaste' on macOS.
-- For Windows, Neovim usually handles it automatically if a compatible
-- clipboard tool is available.
vim.opt.clipboard = 'unnamedplus'

-- Indentation Settings:
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.tabstop = 2        -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2     -- Number of spaces for indenting
vim.opt.autoindent = true  -- Copy indent from current line when starting new line

-- Search Behavior:
vim.opt.hlsearch = true    -- Highlight all matches when searching
vim.opt.incsearch = true   -- Highlight matches as you type your search query
vim.opt.ignorecase = true  -- Ignore case in search patterns
vim.opt.smartcase = true   -- Override ignorecase if search pattern contains uppercase characters

-- UI and Navigation Improvements:
vim.opt.syntax = "on"      -- Enable syntax highlighting for file types (important for functionality)
-- 'updatetime' controls the delay in milliseconds for when 'CursorHold' events are triggered.
-- A lower value (e.g., 50ms) can make the editor feel more responsive overall.
vim.opt.updatetime = 50

-- Lines of context around the cursor when scrolling.
-- A value like 15 ensures the cursor doesn't get too close to the
-- top/bottom of the screen without causing a scroll, providing a buffer zone.
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8  -- Columns of context for horizontal scrolling
vim.opt.wrap = false       -- Do not wrap long lines

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Set cursor line for better navigation
vim.opt.cursorline = true

-- Show matching brackets
vim.opt.showmatch = true

-- Set statusline always visible
vim.opt.laststatus = 2

-- Command line completion
vim.opt.wildmenu = true

-- History for commands and searches
vim.opt.history = 1000

-- Always show the sign column (where LSP diagnostic signs appear)
-- This prevents the text from jumping when diagnostics appear/disappear.
vim.opt.signcolumn = 'yes'

-- Optimize Redrawing:
-- lazyredraw: Delays screen redrawing while executing macros or scripts.
-- This can significantly speed up complex operations that modify the buffer.
vim.opt.lazyredraw = true

-- Command Line Height:
-- cmdheight: Sets the number of lines for the command line. Setting it to 1
-- saves screen space and makes the UI more compact.
vim.opt.cmdheight = 1

-- Shorten messages:
-- shortmess: Control various short messages Neovim displays. This can reduce
-- clutter and improve responsiveness by not drawing lengthy messages.
-- 'F' suppresses file info messages when opening/writing.
vim.opt.shortmess = 'atIcOWF'

-- Statusline Configuration (Vanilla) -----------------------------------------

-- Configure the statusline to display useful information.
-- This uses a format string with special '%' items.
-- For details on format items, see `:help 'statusline'`
vim.opt.statusline = "%F %w%< %P%=[%M%R%y] %l:%c"

-- Ensure autoread is enabled (from your previous config)
vim.opt.autoread = true

-- Ensure list mode and listchars are enabled (from your previous config)
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
  extends = '>',
  precedes = '<',
}

-- Ensure spell is enabled and languages are set (from your previous config)
vim.opt.spell = true
vim.opt.spelllang = 'en_us' -- Keeping it as 'en_us' per your last provided config


-- Additional Performance Optimizations (Vanilla) -----------------------------

-- 'ttyfast': Informs Neovim that the terminal connection is fast.
-- While modern terminals often handle this automatically, it can sometimes
-- provide a slight boost on certain setups or older terminals by reducing
-- delays in sending screen updates.
vim.opt.ttyfast = true

-- Popular Config Options (Uncomment to Test) ---------------------------------

-- Set a specific color scheme (e.g., 'gruvbox', 'tokyonight', 'dracula')
-- Make sure the colorscheme is installed manually (e.g., copy to ~/.config/nvim/colors)
-- if not using a plugin manager.
-- vim.cmd('colorscheme habamax')
-- vim.cmd('colorscheme tokyonight')
-- vim.cmd('colorscheme dracula')

-- Disable swap files (optional, can lead to data loss if Neovim crashes)
-- This reduces disk I/O, which can sometimes impact performance on very slow disks.
-- vim.opt.swapfile = false

-- Don't create backup files (optional)
-- Similar to swapfile, reduces disk writes.
-- vim.opt.backup = false

-- Prevent creating '~' files for backups (optional)
-- Prevents creation of 'filename~' files when saving.
-- vim.opt.writebackup = false

-- Set the leader key (default is '\')
-- Often set to space for easier key combinations.
-- vim.g.mapleader = ' '  -- Set space as the leader key
-- vim.g.maplocalleader = ' ' -- Set space as the local leader key

-- Automatically wrap lines and enable text folding
-- (This conflicts with `vim.opt.wrap = false` above if uncommented, choose one)
-- While `wrap=false` is better for performance on long lines, these are useful options.
-- vim.opt.wrap = true
-- vim.opt.foldmethod = 'syntax' -- Use syntax to determine folds
-- vim.opt.foldlevelstart = 99   -- Start with all folds open

-- Set default font (requires a font with ligatures like Fira Code Nerd Font)
-- This setting is usually done in your terminal emulator (e.g., Alacritty, iTerm2, Kitty),
-- not directly in Neovim unless you're using a GUI client like Neovide.
-- If using GUI clients:
-- vim.opt.guifont = "Fira Code Nerd Font:h12"

-- Optimize behavior when dealing with very long lines or complex syntax:
-- synmaxcol: Specifies the maximum column up to which syntax highlighting is done.
-- Beyond this, syntax highlighting might be disabled for performance on very long lines.
-- vim.opt.synmaxcol = 200

-- Timeout settings for key mappings:
-- timeoutlen: The time (in milliseconds) Neovim waits for a sequence of mapped keys.
-- ttimeoutlen: The time (in milliseconds) Neovim waits for a key code from the terminal.
-- Reducing these can make mappings feel snappier but might conflict with slow terminals
-- or complex mappings.
-- vim.opt.timeoutlen = 500
-- vim.opt.ttimeoutlen = 10

-- Hide the mode indicator (e.g., "-- INSERT --")
-- This slightly reduces screen updates, which can contribute to a snappier feel,
-- but it removes a visual cue that some users rely on.
-- vim.opt.showmode = false

-- Disable fold calculations on startup (if `foldmethod` is set)
-- If you have a foldmethod set (like 'syntax' or 'indent'), Neovim might
-- spend time calculating folds on large files during startup. Disabling
-- this initially can speed up opening. You can then open folds manually.
-- vim.opt.foldenable = false

-- ==============================================================================
-- End of Neovim init.lua Configuration
-- ==============================================================================
