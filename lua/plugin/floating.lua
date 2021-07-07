require'floating'.setup {
defaults = {
-- nvim_open_win() standard params
width = 0.9, -- 0-1 = 0%-100%
height = 0.3, -- 0-1 = 0%-100%
relative = 'editor', -- 'editor'/'win' supported only
style = 'minimal', -- 'minimal' only

-- single & dual
x = 0, -- left -, right +
y = 0, -- down -, up +
pin = 'bot', -- top/topright/right/botright/bot/botleft/left/topleft
winblend = 15,
margin = {1,1,1,1},
enter = true, -- true/false or 'one'/'two'
toggle = true, 

-- single & dual border
border = true, -- true/false - show/hide border
border_thickness = { 1,1,1,1},
borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
title = 'win1',


-- single & dual - height manipulation
grow = false, -- true/false
grow_direction = 'down', -- 'up'/'down'
content_height = false, -- true/false
max_height = 40, -- in row/line count



-- dual window only settings
dual = false, -- true/false
layout = 'vertical', -- 'vertical'/'horizontal'
split = 0.5,
gap = 0,

-- dual window only settings (duplicates)
two_title = 'win2',
two_grow = false, 
two_max_height = 40,
two_grow_direction = false,
two_content_height = false,
two_margin = {1,1,1,1},
},

user_views = {
my_view = { dual = true},
-- add your own custom views here
},
user_actions = {
fwatch_start = function(opts, custom_opts) 
  lo('fstate start') 
 -- lo(opts)
 -- lo(custom_opts)
end
-- add your own custom actions here
},
user_exits = {
fwatch_exit = function(opts, custom_opts) lo('fwatch exit') end
},

}


