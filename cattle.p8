pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

turn = 1
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

  -- draw the cursor on-screen
  spr(1, 1, cursor.selection * 8 + 3)

  -- output a list of options for the player
  for key, option in pairs(options) do
    -- How far from the edge of the screen the text is
    local margin = 8
    -- how far apart the text should be from the next item in the list
    local padding = 4
    -- the y location of this item in the list
    local location = (key * (5 + padding)) - padding

    print(option.name, margin, location + margin)
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000088888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700088888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
