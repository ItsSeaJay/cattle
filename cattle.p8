pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

screen = {
	size = 128
}

function _init()
	battle:push_state(function ()
	 print("ashens is skill")
	end)
end

function _update()
	battle:update()
end

function _draw()

end

-->8

-- utility functions

function wave(height)
	return sin(time()) * height + height
end

-->8

battle = {
	states = {},
	state = 1,
	turn = 1,
	combatants = {}
}

function battle:update()
 self.states[self.state]()
end

function battle:push_state(state)
 add(self.states, state)
end

function battle:pop_state(state)
 del(self.states, state)
end

function battle:get_next_state()
 if self.state + 1 > count(states) then
 	return self.states[1]
 else
 	return self.states[self.state + 1]
 end
end

function battle:get_last_state()
 if self.state - 1 < 1 then
 	return self.states[1]
 else
 	return self.states[self.state + 1]
 end
end

function battle:advance()
 if self.state + 1 > count(states) then
 	self.state = 1
 else
 	self.state = self.state + 1
 end
end

__gfx__
00000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
