pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

-- cattle
-- by sea jay

screen = {
	size = 128
}
-- this refers to the dimensions of the system font
text = {
	width = 3,
	height = 5
}

function _init()
	battle:init()
end

function _update()
	battle:update()
end

function _draw()
	cls()

	if menu.visible then
		menu:draw()
	end

	player:draw()
	enemy:draw()
end

-->8

-- utility functions

function wave(wavelength)
	return sin(time()) * wavelength + wavelength
end

-->8

-- battle

battle = {
	turn = 1,
	combatants = {},
	teams = {}
}

function battle:init()
 add(self.combatants, player)
 add(self.combatants, enemy)
end

function battle:update()
	-- battle using the owner of the current turn
 self.combatants[self.turn % count(self.combatants) + 1]:battle()
end

function battle:advance()
 turn = turn + 1
end

function get_teams()
 -- todo: get the teams participating in the battle
end

-->8

player = {
	hitpoints = 10,
	team = "heroes",
	x = screen.size / 3,
	y = screen.size / 2,
	colour = 9 -- orange
}

function player:battle()
 
end

function player:draw()
 print(self.hitpoints, self.x, self.y - 6, self.colour)
 print("🐱", self.x, self.y, self.colour)
end

-->8

-- enemy

enemy = {
	hitpoints = 10,
	team = "villains",
	x = screen.size / 3 * 2,
	y = screen.size / 2,
	colour = 7 -- white
}

function enemy:battle()
 
end

function enemy:draw()
 print(self.hitpoints, self.x, self.y - 6, self.colour)
 print("🐱", self.x, self.y, self.colour)
end

-->8

menus = {
	player = {
		options = {
			{
				name = "attack",
				use = function ()
				 
				end
			},
			{
				name = "defend",
				use = function ()
				 
				end
			},
			{
				name = "escape",
				use = function ()
				 
				end
			}
		}
	}
}

menu = {
	options = {},
	visible = true,
	margin = 12,
	padding = 4,
	cursor = { -- note: this appears to be a reserved keyword

	}
}

function menu:draw()
 for option in all(menu.options) do
  -- loop code
 end
end

__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
