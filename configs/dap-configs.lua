local dap = require "dap"

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
