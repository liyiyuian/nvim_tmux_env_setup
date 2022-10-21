local view = require("iron.view")

-- iron.setup {...

-- One can always use the default commands from vim directly
repl_open_cmd = "vertical botright 80 split"

-- But iron provides some utility functions to allow you to declare that dynamically,
-- based on editor size or custom logic, for example.

-- Vertical 50 columns split
-- Split has a metatable that allows you to set up the arguments in a "fluent" API
-- you can write as you would write a vim command.
-- It accepts:
--   - vertical
--   - leftabove/aboveleft
--   - rightbelow/belowright
--   - topleft
--   - botright
-- They'll return a metatable that allows you to set up the next argument
-- or call it with a size parameter
repl_open_cmd = view.split.vertical.botright(50)

-- If the supplied number is a fraction between 1 and 0,
-- it will be used as a proportion
repl_open_cmd = view.split.vertical.botright(0.61903398875)

-- The size parameter can be a number, a string or a function.
-- When it's a *number*, it will be the size in rows/columns
-- If it's a *string*, it requires a "%" sign at the end and is calculated
-- as a percentage of the editor size
-- If it's a *function*, it should return a number for the size of rows/columns

repl_open_cmd = view.split("40%")

-- You can supply custom logic
-- to determine the size of your
-- repl's window
repl_open_cmd = view.split.topleft(function()
  if some_check then
    return vim.o.lines * 0.4
  end
  return 20
end)

-- An optional set of options can be given to the split function if one
-- wants to configure the window behavior.
-- Note that, by default `winfixwidth` and `winfixheight` are set
-- to `true`. If you want to overwrite those values,
-- you need to specify the keys in the option map as the example below

repl_open_cmd = view.split("40%", {
  winfixwidth = false,
  winfixheight = false,
  -- any window-local configuration can be used here
  number = true
})
