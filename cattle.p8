pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

turn = 1
text_height = 5
options = {
  { 
    name = "attack",
    use = function (target)
      -- body
    end
  },
  {
    name = "defend",
    use = function (target)
      -- body
    end
  },
  {
    name = "run",
    use = function (target)
      -- body
    end
  }
}
cursor = {
  selection = 1
}
width = 128
height = width

function _init()
  -- body
end

function _update()
  if btnp(⬆️) then
    -- check if moving the cursor should underflow the selection
    if cursor.selection - 1 < 1 then
      cursor.selection = count(options)
    else
      cursor.selection = cursor.selection - 1
    end
  end

  if btnp(⬇️) then
    -- check if moving the cursor should overflow the selection
    if cursor.selection + 1 > count(options) then
      cursor.selection = 1
    else
      cursor.selection = cursor.selection + 1
    end
  end
end

function _draw()
  cls()

  -- how far from the edge of the screen the text is
  local margin = 12
  -- how far apart the text should be from the next item in the list
  local padding = 4

  -- show the cursor based on the current selection
  spr(1, 1, margin + (cursor.selection * (text_height + padding)) - (text_height + padding))

  -- output a list of options for the player
  for key, option in pairs(options) do
    -- the y location of this item in the list
    local location = (key * (text_height + padding)) - (text_height + padding)

    print(option.name, margin, location + margin)
  end
end
__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
