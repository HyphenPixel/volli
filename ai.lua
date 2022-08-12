--
-- AI CODE
--

AI = {}

function AI:load()
	self.img = love.graphics.newImage("assets/ai.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.dc = 0
	self.x = love.graphics.getWidth() - self.width - 50
	self.y = love.graphics.getHeight() / 2
	self.vy = 0
	self.speed = 300
end

function AI:update(dt)
	self:move(dt)
	self:check_bounds(dt)
end

function AI:move(dt)
	self.y = self.y + self.vy * dt
	self:aquire_target(dt)
end

function AI:check_bounds(dt)
        if self.y < 0 then
                self.y = 0
        elseif self.y + self.height > love.graphics.getHeight() then
                self.y = love.graphics.getHeight() - self.height
	end
end

function AI: aquire_target(dt)
	if Ball.y - Ball.height < self.y then
		self.dy = -self.speed
	elseif Ball.y > self.y + self.height then
		self.dy = self.speed
	else
		self.dy = self.dy / 1.2
	end
	self.y = self.y + self.dy * dt
end

function AI:draw()
	love.graphics.draw(self.img, self.x, self.y)
end
