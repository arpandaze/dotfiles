local PROJECT_PATH = "/home/daze/Documents/TestProj"

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function ()
    local current_filename = vim.api.nvim_buf_get_name(0)

    if string.find(current_filename, PROJECT_PATH) then
      print("Hola amigo")
    else
      return
    end


	end,
})
