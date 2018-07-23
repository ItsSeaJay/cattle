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
modes = {
	debug = "debug",
	release = "release"
}
mode = modes.release

function _init()
	battle:init()
end

function _update()
	battle:update()

	if menu.visible then
		menu:update()
	end
end

function _draw()
	cls()

	if menu.visible then
		menu:draw()
	end

	battle:draw()

	if mode == modes.debug then
		-- print a whole host of information useful for debugging
		print(
			"turn: "..battle.turn,
		 text.width, screen.size - (text.height)
		)
		local owner = battle.combatants[battle.turn % count(battle.combatants) + 1].name
		print(
			owner.."'s turn",
			text.width, screen.size - (text.height * 2)
		)
	end
end

-->8

-- utility functions

-- useful for positioning objects that move in a wave-like pattern
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
	-- add some fighters to the battle
	-- the combatants list is first in, last out
	-- here the player goes first
 add(self.combatants, enemy)
 add(self.combatants, player)
end

function battle:update()
	-- find out who 'owns' this turn
	local owner = battle.turn % count(battle.combatants) + 1

	-- perform battle using the owner of the current turn
 self.combatants[owner]:battle()
end

function battle:draw()
 for key, combatant in pairs(self.combatants) do
  combatant:draw()
 end
end

function battle:advance()
 self.turn = self.turn + 1
end

function get_teams()
 -- todo: get the teams participating in the battle
 --       by iterating over the list of combatants
end

-->8

player = {
	name = "bob",
	hitpoints = 10,
	team = "heroes",
	x = screen.size / 3,
	y = screen.size / 2,
	colour = 9 -- orange
}

function player:battle()
 -- allow the player to move the menu cursor
 if btnp(⬇️) then
 	-- move the cursor down
 	menu.cursor.selection = menu.cursor.selection % count(menu.options) + 1
 end
end

function player:draw()
 print(self.hitpoints, self.x, self.y - (text.height + 1), self.colour)
 print("🐱", self.x, self.y, self.colour)
 print(self.name, self.x, self.y + (text.height + 1), self.colour)
end

-->8

-- enemy

enemy = {
	name = "alice",
	hitpoints = 10,
	team = "villains",
	x = screen.size / 3 * 2,
	y = screen.size / 2,
	colour = 7 -- white
}

function enemy:battle()
 player.hitpoints = player.hitpoints - 1

 -- pass the turn
 battle:advance()
end

function enemy:draw()
 print(self.hitpoints, self.x, self.y - (text.height + 1), self.colour)
 print("🐱", self.x, self.y, self.colour)
 print(self.name, self.x, self.y + 1 + (text.height + 1), self.colour)
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
	options = menus.player.options,
	visible = true,
	margin = 12,
	padding = 4,
	cursor = { -- note: this appears to be a reserved keyword
		x = 1,
		y = 1,
		sprite = 1,
		selection = 1
	}
}

function menu:update()
	menu.cursor.y = (menu.cursor.selection * (text.height + self.padding)) - (text.height + self.padding)
end

function menu:draw()
	spr(menu.cursor.sprite, wave(2), menu.cursor.y + self.margin)

	-- draw the options available to the player
 for key, option in pairs(self.options) do
 	local x = self.margin
  local y = (key * (text.height + self.padding)) - (text.height + self.padding)
  local colour = 6 -- light grey

  print(option.name, x, y + self.margin, colour)
 end
end

__gfx__
00000000990000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000889900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000884400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
