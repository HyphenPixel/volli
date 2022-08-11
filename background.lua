--
-- BACKGROUND CODE
--

Background = {}

function Background:load()
	self.stars = love.graphics.newImage("assets/background.png")
	self.planets = love.graphics.newImage("assets/planets.png")
end

function Background:update()

end

function Background:draw()
	love.graphics.draw(self.stars, 0, 0)
	love.graphics.draw(self.planets, 0, 0)
end
