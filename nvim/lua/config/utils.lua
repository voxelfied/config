-- Delete Current File (Function)

function _G.delete_current_file()
    local file_path = vim.fn.expand("%:p")
    os.remove(file_path)
end
