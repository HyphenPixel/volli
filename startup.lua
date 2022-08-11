--
-- STARTUP CODE
--

Startup = {}

function Startup:load()
	fx_play = true
	self.splash = love.graphics.newImage("assets/splash_static.png")
	self.intro = love.audio.newSource("assets/sounds/intro.ogg", "static")
end

function Startup:update(dt)

end

function Startup:draw()
	love.graphics.draw(self.splash, love.graphics.getWidth() / 2 - 80, love.graphics.getHeight() / 2 - 96)
	if fx_play then
		self.intro:play()
		fx_play = false
	end
end

