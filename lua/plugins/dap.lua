return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dapui = require("dapui")
            dapui.setup()

            local dap = require("dap")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    keys = function()
        local function dap(name)
            return function()
                require("dap")[name]()
            end
        end

        return {
            { "<leader>dc", dap("continue"), desc = "continue" },
            { "<leader>ds", dap("step_into"), desc = "step into" },
            { "<leader>dn", dap("step_over"), desc = "step over (next)" },
            { "<leader>df", dap("step_out"), desc = "step out (finish)" },
            { "<leader>db", dap("toggle_breakpoint"), desc = "toggle breakpoint" },
            {
                "<leader>do",
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
            { "<leader>dl", dap("clear_breakpoints"), desc = "clear breakpoints" },
            { "<leader>dq", dap("terminate"), desc = "quit" },
        }
    end,
    config = function()
        local dap = require("dap")

        local signs = { DapBreakpoint = "", DapBreakpointCondition = "", DapLogPoint = "" }
        for hl, icon in pairs(signs) do
            vim.fn.sign_define(hl, { text = icon, texthl = "Error" })
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
