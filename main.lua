--
-- MAIN CODE
--

require("game")
require("startup")

function love.load()
	time = 0
	game_start = false
	rect = {x=0, y=0, width=love.graphics.getWidth(), height=love.graphics.getHeight()}
	Startup:load()
	Game:load()
end

function love.update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit(0)
	end

	if game_start then
		Game:update(dt)
	else
		Startup:update(dt)
		time = time + 1
	end
end

function love.draw()
	if time >= 50 then
		game_start = true
	end

	if game_start then
		Game:draw()
	else
		Startup:draw()
	end
end

