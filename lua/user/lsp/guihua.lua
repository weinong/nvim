local status_ok, guihua = pcall(require, "guihua.maps")
if not status_ok then
	return
end

guihua.setup({
  maps = {
    close_view = '<C-e>',
    save = '<C-s>',
    jump_to_list = '<C-w>k',
    jump_to_preview = '<C-w>j',
    prev = '<C-p>',
    next = '<C-n>',
    pageup = '<C-b>',
    pagedown = '<C-f>',
    confirm = '<C-o>',
    split = '<C-s>',
    vsplit = '<C-v>',
  },
})
