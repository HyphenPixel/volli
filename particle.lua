--
-- PARTICLE CODE
--

Particle = {}

function Particle:load()
	local img = love.graphics.newImage('assets/particle.png')

	self.sys = love.graphics.newParticleSystem(img, 50)
	self.sys:setParticleLifetime(1, 3)
	self.sys:setLinearAcceleration(0, 0, 0, 100)
	self.sys:setColors(1, 1, 1, 1, 1, 1, 1, 0)
	self.sys2 = self.sys:clone()
	self.sys2:setLinearAcceleration(0, 0, 0, -100)
end

function Particle:update(dt)
	self.sys:update(dt)
	self.sys2:update(dt)
	self.sys2:emit(32)
	self.sys:emit(32)
end

function Particle:draw()
	love.graphics.draw(self.sys, love.graphics.getWidth() * 0.5 + 2.5, love.graphics.getHeight() * 0.5)
	love.graphics.draw(self.sys2, love.graphics.getWidth() * 0.5 + 2.5, love.graphics.getHeight() * 0.5)
end
