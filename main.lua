local helium = require 'helium'
local scene = helium.scene.new(true)

local elementCreator = helium(function(param, view)
	return function()
		love.graphics.setColor(0.3, 0.3, 0.3)
		love.graphics.rectangle('fill', 0, 0, view.w, view.h)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(param.text)
	end
end)

local element = elementCreator({text = 'foo-bar'}, 100, 20)
--Needs to be called only once, to draw and then :undraw to stop drawing it onscreen
element:draw(100, 100)

function love.update(dt)
	scene:update(dt)
end

function love.draw()
	scene:draw()
end