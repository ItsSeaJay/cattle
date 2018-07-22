pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

turn = 1
text_height = 5
margin = 12
padding = 4
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
  selection = 1,
  draw = function ()
    local offset = wave() * 3 + 3
    local location = (cursor.selection * (text_height + padding)) - (text_height + padding)

    -- show the cursor based on the current selection
    spr(1, offset, margin + location)
  end
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

  cursor.draw()

  -- output a list of options for the player
  for key, option in pairs(options) do
    -- the y location of this item in the list
    local location = (key * (text_height + padding)) - (text_height + padding)
    local colour = 5 -- dark gray

    -- display the text differently if it's been selected
    if key == cursor.selection then
      -- highlight that option using position, colour and a shadow
      print(option.name, margin, location + margin, 6)
      colour = 7 -- white
      location = location - 1
    end

    print(option.name, margin, location + margin, colour)
  end
end

-->8

function wave()
  return sin(time())
end
__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
