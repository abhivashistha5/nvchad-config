local map = vim.keymap.set

map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open debugging sidebar" })

map("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debugger: Start" })

map("n", "<F17>", function()
  require("dap").terminate()
end, { desc = "Debugger: Stop" })

map("n", "<F21>", function()
  vim.ui.input({ prompt = "Condition: " }, function(condition)
    if condition then
      require("dap").set_breakpoint(condition)
    end
  end)
end, { desc = "Debugger: Conditional Breakpoint" })

map("n", "<F29>", function()
  require("dap").restart_frame()
end, { desc = "Debugger: Restart" }) -- Control+F5

map("n", "<F6>", function()
  require("dap").pause()
end, { desc = "Debugger: Pause" })

map("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger: Toggle Breakpoint" })

map("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debugger: Step Over" })

map("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debugger: Step Into" })

map("n", "<F23>", function()
  require("dap").step_out()
end, { desc = "Debugger: Step Out" })

map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint (F9)" })

map("n", "<leader>dB", function()
  require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints" })

map("n", "<leader>dc", function()
  require("dap").continue()
end, { desc = "Start/Continue (F5)" })

map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into (F11)" })

map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over (F10)" })

map("n", "<leader>dC", function()
  vim.ui.input({ prompt = "Condition: " }, function(condition)
    if condition then
      require("dap").set_breakpoint(condition)
    end
  end)
end, { desc = "Conditional Breakpoint (S-F9)" })

map("n", "<leader>dO", function()
  require("dap").step_out()
end, { desc = "Step Out (S-F11)" })

map("n", "<leader>dq", function()
  require("dap").close()
end, { desc = "Close Session" })

map("n", "<leader>dQ", function()
  require("dap").terminate()
end, { desc = "Terminate Session (S-F5)" })

map("n", "<leader>dp", function()
  require("dap").pause()
end, { desc = "Pause (F6)" })

map("n", "<leader>dr", function()
  require("dap").restart_frame()
end, { desc = "Restart (C-F5)" })

map("n", "<leader>dR", function()
  require("dap").repl.toggle()
end, { desc = "Toggle REPL" })

map("n", "<leader>da", function()
  require("dap").run_to_cursor()
end, { desc = "Run To Cursor" })
