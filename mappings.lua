local M = {}

M.toggleterm = {
  plugin = true,
  n = {
    ["<leader>gg"] = {
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new {
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          float_opts = {
            border = "double",
          },
        }
        lazygit:toggle()
      end,
      "lazygit",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    -- modified function keys found with `showkey -a` in the terminal to get key code
    -- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Debugger: Start",
    },
    ["<F17>"] = {
      function()
        require("dap").terminate()
      end,
      "Debugger: Stop",
    }, -- Shift+F5
    ["<F21>"] = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            require("dap").set_breakpoint(condition)
          end
        end)
      end,
      "Debugger: Conditional Breakpoint",
    },
    ["<F29>"] = {
      function()
        require("dap").restart_frame()
      end,
      "Debugger: Restart",
    }, -- Control+F5
    ["<F6>"] = {
      function()
        require("dap").pause()
      end,
      "Debugger: Pause",
    },
    ["<F9>"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Debugger: Toggle Breakpoint",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Debugger: Step Over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Debugger: Step Into",
    },
    ["<F23>"] = {
      function()
        require("dap").step_out()
      end,
      "Debugger: Step Out",
    }, -- Shift+F11
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint (F9)",
    },
    ["<leader>dB"] = {
      function()
        require("dap").clear_breakpoints()
      end,
      "Clear Breakpoints",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Start/Continue (F5)",
    },
    ["<leader>dC"] = {
      function()
        vim.ui.input({ prompt = "Condition: " }, function(condition)
          if condition then
            require("dap").set_breakpoint(condition)
          end
        end)
      end,
      "Conditional Breakpoint (S-F9)",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into (F11)",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over (F10)",
    },
    ["<leader>dO"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out (S-F11)",
    },
    ["<leader>dq"] = {
      function()
        require("dap").close()
      end,
      "Close Session",
    },
    ["<leader>dQ"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate Session (S-F5)",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause (F6)",
    },
    ["<leader>dr"] = {
      function()
        require("dap").restart_frame()
      end,
      "Restart (C-F5)",
    },
    ["<leader>dR"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle REPL",
    },
    ["<leader>ds"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run To Cursor",
    },
  },
}

M.nvim_dap_ui = {
  plugin = true,
  n = {
    ["<leader>dE"] = {
      function()
        vim.ui.input({ prompt = "Expression: " }, function(expr)
          if expr then
            require("dapui").eval(expr)
          end
        end)
      end,
      "Evaluate Input",
    },
    ["<leader>dui"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debugger UI",
    },
    ["<leader>dh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Debugger Hover",
    },
  },
  v = {
    ["<leader>dE"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate Input",
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>o"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

return M
