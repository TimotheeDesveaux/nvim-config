return {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui" },
    keys = {
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "continue",
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "step into",
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "step over",
        },
        {
            "<leader>dt",
            function()
                require("dap").step_out()
            end,
            desc = "step out",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "toggle breakpoint",
        },
        {
            "<leader>dn",
            function()
                vim.ui.input({ prompt = "Condition: " }, function(input)
                    if input == nil then
                        return
                    end
                    require("dap").set_breakpoint(input)
                end)
            end,
            desc = "set conditional breakpoint",
        },
        {
            "<leader>dl",
            function()
                require("dap").clear_breakpoints()
            end,
            desc = "clear breakpoints",
        },
        {
            "<leader>dq",
            function()
                require("dap").terminate()
            end,
            desc = "quit",
        },
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        local signs = { DapBreakpoint = "", DapBreakpointCondition = "", DapLogPoint = "" }
        for hl, icon in pairs(signs) do
            vim.fn.sign_define(hl, { text = icon, texthl = "Error" })
        end

        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

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
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end,
}
