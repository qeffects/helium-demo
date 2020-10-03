require("args")
local helium = require("helium")
local elfac = require("col")
local elfac2 = require("row")
local buttonFactory = require("button")

love.window.setMode(800, 1000)
heliumTime = 0

local function randStr(len)
	local fullstr = ''
	for i = 1, len do
		fullstr = fullstr..string.char(math.random(33, 126))
	end
	return fullstr
end

elfac({text=randStr(10)},200, 400):draw(10,10)
elfac2({text=randStr(10)},600, 50):draw(10,420)
elfac2({text=randStr(10)},600, 50):draw(10,490)

function love.load()
	helium.load()
end

if options.vsdebug then
	require("lldebugger").start()
end

function love.keypressed(key)
	if key == 'e' then
		for i = 1, 10 do
			buttonFactory({text=randStr(10)},math.random(20,200), math.random(20,200)):draw(math.random(0,700),math.random(0,200))
		end
	end

	if key == "return" then
		helium.atlas.createdAtlas:refragment()
	end
end

function love.draw()
	love.graphics.print('atlas:',0,580)
	love.graphics.setColor(0.1,0.1,0.1)
	love.graphics.rectangle('fill',0,600,800,400)
	love.graphics.setColor(1,1,1)
	love.graphics.draw(helium.atlas.createdAtlas.canvas,0,600,0,0.5,0.5)
end

local count = 1.1
function love.update(dt)
	--count = count + dt
	if count>1 then
		count = 0
	end
	local l = love.graphics.getStats()
	print('vmem:'..(math.floor((l.texturememory/1024/1024)*1000)/1000)..'MB ', 'lib time:'..(math.floor(heliumTime*100000)/100)..'ms', 'elements: ', #helium.elementBuffer)
end