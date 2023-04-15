local settings = require('mason-nvim-dap.settings')

local M = {}

local function mason_tool_path(tool)
    -- TOOD: handle '/' in a more cross platform way (maybe use 'mason-code.path' module ?)
    -- TODO: the path below is the default install path, should query mason for the install path
    --       in case people configure the path in their mason config
    return vim.fn.stdpath("data") .. "/mason/bin/" .. tool
end

M.bash = {
    type = 'executable',
    command = mason_tool_path('bash-debug-adapter'),
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
M.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = mason_tool_path('dlv'),
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
}

M.python = {
    type = 'executable',
    command = mason_tool_path('debugpy-adapter'),
}

M.node2 = {
    type = 'executable',
    command = mason_tool_path('node-debug2-adapter'),
}

M.chrome = {
    type = 'executable',
    command = mason_tool_path('chrome-debug-adapter'),
}

M.firefox = {
    type = 'executable',
    command = mason_tool_path('firefox-debug-adapter'),
}

M.php = {
    type = 'executable',
    command = mason_tool_path('php-debug-adapter'),
}

M.coreclr = {
    type = 'executable',
    command = mason_tool_path('netcoredbg'),
    args = { '--interpreter=vscode' },
}

M.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = mason_tool_path('OpenDebugAD7'),
}
if vim.fn.has('win32') == 1 then
    M.cppdbg.options = {
        detached = false,
    }
end

M.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = mason_tool_path('codelldb'),
        args = { '--port', '${port}' },
    },
}
if vim.fn.has('win32') == 1 then
    M.codelldb.executable.detached = false
end

M.mix_task = {
    type = 'executable',
    command = mason_tool_path('elixir-ls-debugger'), -- https://github.com/williamboman/mason.nvim/blob/d97579ccd5689f9c6c365e841ea99c27954112ec/lua/mason-registry/elixir-ls/init.lua#L26
    args = {},
}

M.kotlin = {
    type = 'executable',
    command = mason_tool_path('kotlin-debug-adapter'),
    args = { '--interpreter=vscode' },
}

M.dart = {
    type = 'executable',
    command = mason_tool_path('dart-debug-adapter'),
    args = { 'flutter' },
}

return M
