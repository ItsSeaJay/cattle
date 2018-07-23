pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

screen = {
	size = 128
}

function _init()
	battle:init()
end

function _update()
	battle:update()
end

function _draw()
	cls()

	player:draw()
	enemy:draw()
end

-->8

-- utility functions

function wave(wavelength)
	return sin(time()) * wavelength + wavelength
end

-->8

battle = {
	turn = 1,
	combatants = {}
}

function battle:init()
 add(self.combatants, player)
 add(self.combatants, enemy)
end

function battle:update()
 self.combatants[self.turn]:battle()
end

function battle:advance()
 turn = turn + 1
end

-->8

player = {
	hitpoints = 10,
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

enemy = {
	hitpoints = 10,
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

__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
