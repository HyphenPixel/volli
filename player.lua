-- 
-- PLAYER CODE
--

Player = {}

function Player:load()
	self.x = 50
	self.y = love.graphics.getHeight() / 2
	self.dy = 0
	self.img = love.graphics.newImage("assets/player.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.speed = 500
	
	-- ! maybe move joystick code to different file
	--game_pads = love.joystick.getJoysticks()
	--game_pad = game_pads[1]
end

function Player:update(dt)
	self:move(dt)
	self:check_bounds()
end

function Player:move(dt)
	local button_pressed = false

	if love.keyboard.isDown("w") then
		button_pressed = true
                self.dy = -self.speed
        elseif love.keyboard.isDown("s") then
		button_pressed = true
                self.dy = self.speed
	else
		button_pressed = false
	end

	if not button_pressed then
		self.dy = self.dy / 1.2
	end

	self.y = self.y + self.dy * dt
end

function Player:check_bounds()
	if self.y < 0 then
                self.y = 0
        elseif self.y + self.height > love.graphics.getHeight() then
                self.y = love.graphics.getHeight() - self.height
        end
end

function Player:draw()
	love.graphics.draw(self.img, self.x, self.y)
end
