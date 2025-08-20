local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd [[packadd packer.nvim]]

require("plugins")
require("mycmp")
require(".lsp.lsp-conf")
require("myluasnip")
require("settings")
require("keymaps")
require("stefan-plugin")
-- require("hex").setup()
require("diffview").setup()
-- require("store").setup()
