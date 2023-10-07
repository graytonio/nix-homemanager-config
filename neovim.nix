{ pkgs, ... }: { 
    programs.neovim = {
		enable = true;
		defaultEditor = true;
		vimAlias = true;
		extraLuaConfig = ''
			vim.opt.nu = true
			vim.opt.relativenumber = true

			vim.opt.tabstop = 4
			vim.opt.softtabstop = 4
			vim.opt.shiftwidth = 4
			vim.opt.expandtab = true
			vim.opt.smartindent = true

			vim.opt.wrap = false

			vim.opt.hlsearch = false
			vim.opt.incsearch = true

			vim.opt.termguicolors = true

			vim.opt.scrolloff = 8
			vim.opt.signcolumn = "yes"
			vim.opt.isfname:append("@-@")
			vim.opt.updatetime = 50

			vim.g.mapleader = " "
            vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
		'';
		plugins = [
			{
                plugin = pkgs.vimPlugins.telescope-nvim;
                type = "lua";
                config = ''
                    local builtin = require("telescope.builtin")
                    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
                    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
                    vim.keymap.set('n', '<leader>ps', function()
                        builtin.grep_string({ search = vim.fn.input("Grep > ") });
                    end)
                '';
            }
            {
                plugin = pkgs.vimPlugins.dracula-nvim;
                type = "lua";
                config = ''
                    local dracula = require("dracula")
                    dracula.setup({
                        show_end_of_buffer = true,
                        transparent_bg = true,
                        italic_comment = true,
                    })
                    vim.cmd[[colorscheme dracula]]
                '';
            }
            {
                plugin = pkgs.vimPlugins.harpoon;
                type = "lua";
                config = ''
                    local mark = require("harpoon.mark")
                    local ui = require("harpoon.ui")

                    vim.keymap.set("n", "<leader>a", mark.add_file)
                    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

                    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
                    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
                    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
                    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
                '';
            }
            pkgs.vimPlugins.nvim-lspconfig
            pkgs.vimPlugins.mason-nvim
            pkgs.vimPlugins.mason-lspconfig-nvim
            pkgs.vimPlugins.nvim-cmp
            pkgs.vimPlugins.cmp-nvim-lsp
            pkgs.vimPlugins.cmp-buffer
            pkgs.vimPlugins.cmp-path
            pkgs.vimPlugins.cmp_luasnip
            pkgs.vimPlugins.cmp-nvim-lua
            pkgs.vimPlugins.luasnip
            pkgs.vimPlugins.friendly-snippets
            {
                plugin = pkgs.vimPlugins.lsp-zero-nvim;
                type = "lua";
                config = ''
                    local lsp = require('lsp-zero')
                    lsp.preset('recommended')

                    lsp.ensure_installed({
                        'tsserver',
                        'eslint',
                        'rust_analyzer',
                        'gopls',
                        'dockerls',
                        'jsonls',
                        'rnix',
                        'jedi_language_server',
                    })

                    lsp.nvim_workspace()
                    lsp.setup()
                '';
            }
            #pkgs.vimPlugins.nvim-treesitter.withAllGrammars
            {
                plugin = pkgs.vimPlugins.nvim-treesitter;
                type = "lua";
                config = ''
                    local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
                    vim.fn.mkdir(parser_install_dir, "p")
                    vim.opt.runtimepath:append(parser_install_dir)
                    require'nvim-treesitter.configs'.setup {
                        ensure_installed = {"c", "vim", "javascript", "typescript", "go", "python", "rust", "nix"},
                        sync_install = false,
                        auto_install = true,
                        parser_install_dir = parser_install_dir,
                        highlight = {
                            enable = true,
                            additional_vim_regex_highlighting = false,
                        },
                    }
                '';
            }
            pkgs.vimPlugins.todo-comments-nvim
            pkgs.vimPlugins.markdown-preview-nvim
        ];
	};

}
