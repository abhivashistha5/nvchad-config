local dap = require "dap"

local lldb_vscode_exists = os.execute "which lldb-vscode"

local lldb_vscode_path
if lldb_vscode_exists then
  local handle = io.popen "which lldb-vscode"
  if handle ~= nil then
    lldb_vscode_path = handle:read("*a"):gsub("\n", "")
    handle:close()
  end
end

dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/.debugger/dart/debug.js", "flutter" },
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = "${workspaceFolder}/.fvm/flutter_sdk/bin/cache/dart-sdk/",
    flutterSdkPath = "${workspaceFolder}/.fvm/flutter_sdk",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}",
  },
}
-- typescript
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = { os.getenv "HOME" .. "/.debugger/js-debug/src/dapDebugServer.js", "${port}" },
  },
}
-- dap.adapters["pwa-node"] = {
--   type = "server",
--   host = "127.0.0.1",
--   port = "${port}",
--   executable = {
--     command = "js-debug-adapter",
--     args = { "${port}" },
--   },
-- }
dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}

-- c/c++/rust
dap.adapters.lldb = {
  type = "executable",
  command = lldb_vscode_path,
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
    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
