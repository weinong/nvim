local dap_found, dap = pcall(require, "dap")
if not dap_found then
	return
end

local dapui_found, dapui = pcall(require, "dapui")
if not dapui_found then
	return
end

dapui.setup{} -- default setup

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
