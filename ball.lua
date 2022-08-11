--
-- BALL CODE
--

Ball = {}

function Ball:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.img = love.graphics.newImage("assets/ball.png")
	self.width = self.img:getWidth()
	self.height = self.img:getHeight()
	self.speed = 200
	self.vx = -self.speed
	self.vy = 0
	self.plink = love.audio.newSource("assets/sounds/plink.ogg", "static")
	self.paddle_plink = love.audio.newSource("assets/sounds/paddle_plink.ogg", "static")
	self.score_player = love.audio.newSource("assets/sounds/score_player.ogg", "static")
	self.score_ai = love.audio.newSource("assets/sounds/score_ai.ogg", "static")
end

function Ball:update(dt)
	self:move(dt)
	self:collide()
end

function Ball:move(dt)
	self.x = self.x + self.vx * dt
	self.y = self.y + self.vy * dt
end

function Ball:collide()
	self:collide_wall()
	self:collide_player()
	self:collide_ai()
	self:score()
end

function Ball:collide_player()
	if check_collision(self, Player) then
                self.vx = self.speed
                local ballMid = self.y + self.height / 2
                local playerMid = Player.y + Player.height / 2
                local collisionPosition = ballMid - playerMid
                self.vy = collisionPosition * 5
		self.paddle_plink:play()
        end
end

function Ball:collide_ai()
	if check_collision(self, AI) then
                self.vx = -self.speed
                local ballMid = self.y + self.height / 2
                local aiMid = AI.y + AI.height / 2
                local collisionPosition = ballMid - aiMid
                self.vy = collisionPosition * 5
        	self.paddle_plink:play()
	end
end

function Ball:collide_wall()
	if self.y < 0 then
		self.y = 0
		self.vy = -self.vy
		self.plink:play()
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
		self.vy = -self.vy
		self.plink:play()
	end
end

function Ball:score()
	if self.x < -20 then
        	self:reset(1)
		self.score_ai:play()
		Score.ai = Score.ai + 1
	end
        if self.x > love.graphics.getWidth() + 5 then
        	self:reset(-1)
		Score.player = Score.player + 1
		self.score_player:play()
	end	
end

function Ball:reset(mod)
	self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height
        self.vx = self.speed * mod
end

function Ball:draw()
	love.graphics.draw(self.img, self.x, self.y)
end
