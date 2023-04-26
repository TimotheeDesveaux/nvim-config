local M = {}

function M.telescope(builtin)
    return function()
        require("telescope.builtin")[builtin]()
    end
end

return M
