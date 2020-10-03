local input = require("helium.core.input")
local state = require("helium.control.state")
local layout = require("helium.layout")
local helium = require("helium")
local cfac = require("button")

return helium(function(param, size) 
	local f = state({f = false})
	local childs = {
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
		cfac({}),
	}
	input('clicked', function ()
		f.f = not f.f
	end)
	return function()
		if not f.f then
			love.graphics.setColor(0.1,0.1,0.1)
		else
			love.graphics.setColor(0.4,0.4,0.4)
		end
		love.graphics.rectangle('fill',0,0,size.w,size.h)
		
		love.graphics.setColor(0.9,0.9,0.9)
		love.graphics.rectangle('line',0,0,size.w,size.h)

		local l = layout():top(20):left(20)
			for i, e in ipairs(childs) do
				e:draw()
			end
		l:draw()
		love.graphics.setColor(1,1,1)
		love.graphics.print("column layout:",3)
	end
end)