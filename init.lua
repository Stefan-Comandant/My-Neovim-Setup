local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd [[packadd packer.nvim]]

-- local modpath = (...)
-- print(modpath)
-- if modpath == "nil" then
--     print("scheisse is nil")
-- end
-- print("mod_path: " .. modpath)

require("plugins")
require("settings")
require("keymaps")
require(".lsp.lsp-conf")
require("mycmp")
require("stefan-plugin")
