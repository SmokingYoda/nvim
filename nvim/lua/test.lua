local M = {
    init = { enabled = false }
}

M.toggle = function(command)
    local buffers = vim.api.nvim_list_bufs()

    for _, i in ipairs(buffers) do
        local name = vim.api.nvim_buf_get_name(i)
        local match = string.match(name, "^term:")

        if match then
            if M.init.enabled == false then
                vim.api.nvim_buf_delete(i, { force = true })
                vim.cmd("close")
                M.init.enabled = true
            else
                vim.api.nvim_buf_delete(i, { force = true })
            end
            return
        end
    end

    vim.cmd(command)
end

return M
