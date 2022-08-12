--
-- PARTICLE CODE
--

Particle = {}

function Particle:load()
	local img = love.graphics.newImage('assets/particle.png')

	self.sys = love.graphics.newParticleSystem(img, 1000)
	self.sys:setParticleLifetime(1, 5)
	self.sys:setLinearAcceleration(0, 0, 0, 100)
	self.sys:setColors(1, 1, 1, 1, 1, 1, 1, 0)
end

function Particle:update(dt)
	self.sys:update(dt)
	self.sys:emit(32)
end

function Particle:draw()
	-- Draw the particle system at the center of the game window.
	love.graphics.draw(self.sys, love.graphics.getWidth() * 0.5 + 2, 0)
end
