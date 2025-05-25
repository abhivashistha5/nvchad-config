local map = vim.keymap.set

map("n", "<leader>dE", function()
  vim.ui.input({ prompt = "Expression: " }, function(expr)
    if expr then
      require("dapui").eval(expr)
    end
  end)
end, { desc = "Evaluate Input" })

map("n", "<leader>dui", function()
  require("dapui").toggle()
end, { desc = "Toggle Debugger UI" })

map("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Debugger Hover" })

map("v", "<leader>dE", function()
  require("dapui").eval()
end, { desc = "Evaluate Input" })
