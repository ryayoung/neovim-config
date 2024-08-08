local stdout = vim.loop.new_pipe(false)
local stderr = vim.loop.new_pipe(false)

local handle
handle = vim.loop.spawn("sh", {
    args = {"-c", 'eval "$(command pyenv init -)" && pyenv version-name'},
    stdio = {nil, stdout, stderr}
}, function(code, signal)
    stdout:read_stop()
    stderr:read_stop()
    stdout:close()
    stderr:close()
    handle:close()
end)

stdout:read_start(function(err, data)
    if err then
        print("set_pyenv_version(): Error reading stdout:", err)
    elseif data then
        local version = data:gsub("[\n\r]", "")
        if version ~= "" then
            vim.schedule(function()
                vim.fn.setenv("PYENV_VERSION", version)
                print("Python version:", version)
            end)
        end
    end
end)

stderr:read_start(function(err, data)
    if err then
        print("set_pyenv_version(): Error reading stderr:", err)
    elseif data then
        print("set_pyenv_version(): stderr:", data)
    end
end)


-- local start_time = vim.loop.hrtime()

-- local end_time = vim.loop.hrtime()
-- local duration = (end_time - start_time) / 1e6
-- vim.api.nvim_echo({{string.format("Pyenv setup took %.3f ms", duration), "WarningMsg"}}, true, {})

-- local version = vim.fn.system('eval "$(command pyenv init -)" && pyenv version-name') --:gsub("[\n\r]", "")
-- if version ~= "" then
--     vim.fn.setenv("PYENV_VERSION", version)
-- end
