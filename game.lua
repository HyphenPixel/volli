--
-- GAME CODE
--

require("player")
require("ball")
require("ai")
require("background")
require("particle")


Game = {}

function Game:load()
	Particle:load()
        Background:load()
        Player:load()
        Ball:load()
        AI:load()
	beam_top = love.graphics.newImage("assets/beam_top.png")
	beam_bottom = love.graphics.newImage("assets/beam_bottom.png")
	
	music_playing = false
	Music = love.audio.newSource("assets/sounds/main_theme.ogg", "stream")
        Score = {player = 0, ai = 0}
        font = love.graphics.newFont("assets/fonts/pixel.ttf", 30)
end

function Game:update(dt)
	if not music_playing then
		Music:setVolume(0.4)
		Music:setLooping(true)
		Music:play()
		music_playing = true
	end
	Particle:update(dt)
        Background:update(dt)
        Player:update(dt)
        Ball:update(dt)
        AI:update(dt)
end

function Game:draw()
        Background:draw()
	Particle:draw()
	love.graphics.draw(beam_top, love.graphics.getWidth() * 0.5 - (beam_top:getWidth() / 2), 0)
	love.graphics.draw(beam_bottom, love.graphics.getWidth() * 0.5 - (beam_bottom:getWidth() / 2), love.graphics.getHeight() - beam_bottom:getHeight())
        Player:draw()
        Ball:draw()
        AI:draw()
        draw_score()
end

function draw_score()
        love.graphics.setFont(font)
        love.graphics.print("player: "..Score.player, 20, 465)
        love.graphics.print("ai: "..Score.ai, 380, 465)
end

function check_collision(a, b)
        if a.x + a.width > b.x and a.x < b.x + b.width and
        a.y + a.height > b.y and a.y < b.y + b.height then
                return true
        else
                return false
        end
end

