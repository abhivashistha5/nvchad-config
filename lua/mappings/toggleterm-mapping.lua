local map = vim.keymap.set

map("n", "<leader>gg", function()
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
end, { desc = "lazygit" })

map("n", "<leader>tf", "<cmd> ToggleTerm direction=float <CR>", { desc = "Toggle floating terminal" })
