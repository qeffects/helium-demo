local helium = require 'helium'

local elementCreator = helium(function(param, view)

	return function()
		love.graphics.setColor(0.3, 0.3, 0.3)
		love.graphics.rectangle('fill', 0, 0, view.w, view.h)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(param.text)
	end
end)

local element = elementCreator({text = 'foo-bar'}, 100, 20)

element:draw(100, 100)