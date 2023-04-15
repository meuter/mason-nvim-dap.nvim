local path = require('mason-core.path')

local M = {}

M.bash = {
    type = 'executable',
    command = path.bin_prefix('bash-debug-adapter'),
}

-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
M.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = path.bin_prefix('dlv'),
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    },
}

M.python = {
    type = 'executable',
    command = path.bin_prefix('debugpy-adapter'),
}

M.node2 = {
    type = 'executable',
    command = path.bin_prefix('node-debug2-adapter'),
}

M.chrome = {
    type = 'executable',
    command = path.bin_prefix('chrome-debug-adapter'),
}

M.firefox = {
    type = 'executable',
    command = path.bin_prefix('firefox-debug-adapter'),
}

M.php = {
    type = 'executable',
    command = path.bin_prefix('php-debug-adapter'),
}

M.coreclr = {
    type = 'executable',
    command = path.bin_prefix('netcoredbg'),
    args = { '--interpreter=vscode' },
}

M.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = path.bin_prefix('OpenDebugAD7'),
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
        command = path.bin_prefix('codelldb'),
        args = { '--port', '${port}' },
    },
}
if vim.fn.has('win32') == 1 then
    M.codelldb.executable.detached = false
end

M.mix_task = {
    type = 'executable',
    command = path.bin_prefix('elixir-ls-debugger'), -- https://github.com/williamboman/mason.nvim/blob/d97579ccd5689f9c6c365e841ea99c27954112ec/lua/mason-registry/elixir-ls/init.lua#L26
    args = {},
}

M.kotlin = {
    type = 'executable',
    command = path.bin_prefix('kotlin-debug-adapter'),
    args = { '--interpreter=vscode' },
}

M.dart = {
    type = 'executable',
    command = path.bin_prefix('dart-debug-adapter'),
    args = { 'flutter' },
}

return M
