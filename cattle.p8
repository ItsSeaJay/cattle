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
  }
}
width = 128
height = width

function _init()
  -- body
end

function _update()
  -- body
end

function _draw()
  cls()

  -- output a list of options for the player
  for key, option in pairs(options) do
    local margin = 8
    local location = height - (count(options) * 6) + (key * 6)

    print(option.name, margin, location - margin)
  end
end
