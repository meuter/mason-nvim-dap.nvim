local _ = require('mason-core.functional')
local settings = require('mason-nvim-dap.settings')

local M = {
	['bash'] = { 'sh' },
	['chrome'] = { 'javascriptreact', 'typescriptreact', 'typescript', 'javascript' },
	['codelldb'] = { 'c', 'cpp', 'rust' },
	['coreclr'] = { 'cs', 'fsharp' },
	['cppdbg'] = { 'c', 'cpp', 'rust', 'asm' },
	['dart'] = { 'dart' },
	['delve'] = { 'go' },
	['firefox'] = { 'javascriptreact', 'typescriptreact', 'typescript', 'javascript' },
	['kotlin'] = { 'kotlin' },
	['mix_task'] = { 'elixir' },
	['node2'] = { 'javascriptreact', 'typescriptreact', 'typescript', 'javascript' },
	['php'] = { 'php' },
	['python'] = { 'python' },
}

return M
