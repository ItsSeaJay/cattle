pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

turn = 1
text_height = 5
margin = 10
padding = 4
game = {
  state = "think"
}
menus = {
  action = {
    {
      name = "attack",
      use = function (target)
        target.hitpoints = target.hitpoints - 1
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
}
menu = menus.action
player = {
  hitpoints = 10
}
enemy = {
  hitpoints = 10
}
initiative = {
  player,
  enemy
}
actions = {}
cursor = {
  selection = 1,
  draw = function ()
    local offset = wave(2)
    local location = (cursor.selection * (text_height + padding)) - (text_height + padding)

    -- show the cursor based on the current selection
    spr(1, offset, margin + location)
  end
}
screen = {
  size = 128
}

function _init()
  -- body
end

function _update()
  if game.state == "think" then
    if btnp(⬆️) then
      -- check if moving the cursor should underflow the selection
      if cursor.selection - 1 < 1 then
        cursor.selection = count(menu)
      else
        cursor.selection = cursor.selection - 1
      end
    end

    if btnp(⬇️) then
      -- check if moving the cursor should overflow the selection
      if cursor.selection + 1 > count(menu) then
        cursor.selection = 1
      else
        cursor.selection = cursor.selection + 1
      end
    end

    if btnp(🅾️) then
      add(actions, menu[cursor.selection].use)
      game.state = "fight"
    end
  elseif game.state == "fight" then
    for key, action in pairs(actions) do
      action(enemy)
      del(actions, action)
    end

    game.state = "think"
  end
end

function _draw()
  cls()

  cursor.draw()

  for key, combatant in pairs(initiative) do
    local location = (key * (text_height + padding)) - text_height + padding
    print(combatant.hitpoints.."hp", 32, location + screen.size / 2)
  end

  -- output a list of options for the player depending on the current menu
  for key, option in pairs(menu) do
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

function wave(height)
  return sin(time()) * height + height
end
__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
