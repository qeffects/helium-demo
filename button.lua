local helium = require("helium")
local input = require("helium.core.input")
local state = require("helium.control.state")
local setSize = require("helium.control.size")

return helium(function(param, size)
	local s = state({clicked = false})
	input('clicked', function ()
		s.clicked = not s.clicked
	end)
	setSize(math.random(50, 90), 20)

	return function()
		if not s.clicked then
			love.graphics.setColor(0.1,0.1,0.1)
		else
			love.graphics.setColor(0.6,0.6,0.6)
			setSize(size.w, size.h+0.2)
		end
		love.graphics.rectangle('fill',0,0,size.w,size.h)
		
		love.graphics.setColor(1,1,1)
		love.graphics.print(param.text or '',3)
	end
end) 
