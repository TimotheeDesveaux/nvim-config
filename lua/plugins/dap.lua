local dap = require("dap")
local dapui = require("dapui")
local wk = require("which-key")

dap.adapters.lldb = {
    type = "executable",
    command = vim.trim(vim.fn.system("which lldb-vscode")),
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)

wk.register({
    name = "debugger",
    t = { dap.toggle_breakpoint, "toggle breakpoint" },
    c = { dap.clear_breakpoints, "clear breakpoints" },
    u = { dap.up, "go up in stacktrace" },
    d = { dap.down, "go down in stacktrace" },
    e = { dap.terminate, "exit" },
}, {
    prefix = "<leader>d",
})
