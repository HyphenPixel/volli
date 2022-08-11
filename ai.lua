--
-- AI CODE
--

AI = {}

function AI:load()
	self.img = love.graphics.newImage("assets/ai.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.x = love.graphics.getWidth() - self.width - 50
	self.y = love.graphics.getHeight() / 2
	self.vy = 0
	self.speed = 200
end

function AI:update(dt)
	self:move(dt)
	self:check_bounds()
end

function AI:move(dt)
	self.y = self.y + self.vy * dt
	self:aquire_target()
end

function AI:check_bounds()
        if self.y < 0 then
                self.y = 0
        elseif self.y + self.height > love.graphics.getHeight() then
                self.y = love.graphics.getHeight() - self.height
	end
end

function AI: aquire_target()
	if Ball.y - Ball.height < self.y then
		self.vy = -self.speed
	elseif Ball.y > self.y + self.height then
		self.vy = self.speed
	else
		self.vy = 0
	end
end

function AI:draw()
	love.graphics.draw(self.img, self.x, self.y)
end
