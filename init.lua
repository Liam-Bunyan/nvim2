vim.g.mapleader = " "					-- sets leader key
vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4				-- open in prior window
vim.g.netrw_altv = 1					-- change from left splitting to right splitting
vim.g.netrw_liststyle=3					-- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")
vim.opt.title = true					-- show title
vim.cmd('set path+=**')					-- search current directory recursively
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false				-- turn off vi compatibility mode
vim.opt.number = true					-- turn on line numbers
vim.opt.relativenumber = true			-- turn on relative line numbers
vim.opt.mouse = 'a'						-- enable the mouse in all modes
vim.opt.ignorecase = true				-- enable case insensitive searching
vim.opt.smartcase = true				-- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = false				-- disable all highlighted search results
vim.opt.incsearch = true				-- enable incremental searching
vim.opt.wrap = true						-- enable text wrapping
vim.opt.tabstop = 4						-- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.fileencoding = "utf-8"			-- encoding set to utf-8
vim.opt.pumheight = 10					-- number of items in popup menu
vim.opt.showtabline = 2					-- always show the tab line
vim.opt.laststatus = 2					-- always show statusline
vim.opt.signcolumn = "auto"
vim.opt.expandtab = false				-- expand tab 
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.showmode = true
vim.opt.scrolloff = 8					-- scroll page when cursor is 8 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.guifont = "monospace:h17"
vim.opt.clipboard = unnamedplus
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true				-- split go below
vim.opt.splitright = true				-- vertical split to the right
vim.opt.termguicolors = true			-- terminal gui colors
vim.cmd('colorscheme personal')			-- set colorscheme
vim.cmd('filetype plugin on')			-- set filetype 
vim.cmd('set wildmenu')					-- enable wildmenu

--statusline
vim.cmd "highlight StatusType guibg=#b16286 guifg=#1d2021"
vim.cmd "highlight StatusFile guibg=#fabd2f guifg=#1d2021"
vim.cmd "highlight StatusModified guibg=#1d2021 guifg=#d3869b"
vim.cmd "highlight StatusBuffer guibg=#98971a guifg=#1d2021"
vim.cmd "highlight StatusLocation guibg=#458588 guifg=#1d2021"
vim.cmd "highlight StatusPercent guibg=#1d2021 guifg=#ebdbb2"
vim.cmd "highlight StatusNorm guibg=none guifg=white"
vim.o.statusline = " "
				.. ""
				.. " "
				.. "%l"
				.. " "
				.. " %#StatusType#"
				.. "<< "
				.. "%Y" 
				.. "  "
				.. " >>"
				.. "%#StatusFile#"
				.. "<< "
				.. "%F"
				.. " >>"
				.. "%#StatusModified#"
				.. " "
				.. "%m"
				.. " "
				.. "%#StatusNorm#"
				.. "%="
				.. "%#StatusBuffer#"
				.. "<< "
				.. "﬘ "
				.. "%n"
				.. " >>"
				.. "%#StatusLocation#"
				.. "<< "
				.. "燐 "
				.. "%l,%c"
				.. " >>"
				.. "%#StatusPercent#"
				.. "<< "
				.. "%p%%  "
				.. " >> "

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- reload config
map("n", "<leader>rl", ":source ~/.config/nvim2/init.lua<CR>")	-- reload neovim config

-- Open netrw in 25% split in tree view
map("n", "<leader>l", ":25Lex<CR>")					-- space+e toggles netrw tree view

-- Tab bindings 
map("n", "<leader>t", ":tabnew<CR>")				-- space+t creates new tab
map("n", "<leader>tx", ":tabclose<CR>")				-- space+tx closes current tab
map("n", "<leader>pt", ":tabprevious<CR>")			-- space+pt moves to previous tab
map("n", "<leader>nt", ":tabnext<CR>")				-- space+nt moves to next tab

-- easy split generation
map("n", "<leader>vs", ":vsplit<CR>")				-- space+vs creates a veritcal split
map("n", "<leader>hs", ":split<CR>")				-- space+hs creates a horizontal split

-- easy split navigation
map("n", "<leader>w", "<C-w>h")						-- leader+w switches to left split
map("n", "<leader>e", "<C-w>l")						-- leader+e switches to right split
map("n", "<leader>s", "<C-w>j")						-- leader+d switches to bottom split
map("n", "<leader>n", "<C-w>k")						-- leader+u switches to top split

-- adjust split sizes easier
map("n", "<leader>vl", ":vertical resize +3<CR>")		-- leader+vl resizes vertical split +
map("n", "<leader>vr", ":vertical resize -3<CR>")		-- leader+vr resizes vertical split -

-- buffer navigation
map("n", "<leader>nb", ":bnext <CR>")					-- Space+nb goes to next buffer
map("n", "<leader>pb", ":bprevious <CR>")				-- Space+pb goes to previous buffer
map("n", "<leader>db", ":bd! <CR>")						-- Space+db delets current buffer

-- Visual Maps
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")	-- Replace all instances of highlighted words 
map("v", "J", ":m '>+1<CR>gv=gv")						-- Move current line down
map("v", "K", ":m '>-2<CR>gv=gv")						-- Move current line up

-- Popup menu
map("i", "<C-p>", "<C-n>")								-- select autocomplete popup menu

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- Automatically creates templates
-- if template
map("n", "<leader>i", "iif [ @ ]; then <CR><CR> else <CR><CR> fi <ESC>/@ <CR>")

-- html template
map("n", "<leader>ht", "i<!DOCTYPE html><CR>	<html lang=\"en\"><CR>	<head><CR>	<meta charset=\"UTF-8\"><CR></head><CR></html><ESC><CR>")
