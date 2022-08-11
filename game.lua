--
-- GAME CODE
--

require("player")
require("ball")
require("ai")
require("background")

Game = {}

function Game:load()
        Background:load()
        Player:load()
        Ball:load()
        AI:load()

        Score = {player = 0, ai = 0}
        font = love.graphics.newFont(30)
end

function Game:update(dt)
        Background:update(dt)
        Player:update(dt)
        Ball:update(dt)
        AI:update(dt)
end

function Game:draw()
        Background:draw()
        Player:draw()
        Ball:draw()
        AI:draw()
        draw_score()
end

function draw_score()
        love.graphics.setFont(font)
        love.graphics.print("Player: "..Score.player, 20, 465)
        love.graphics.print("AI: "..Score.ai, 380, 465)
end

function check_collision(a, b)
        if a.x + a.width > b.x and a.x < b.x + b.width and
        a.y + a.height > b.y and a.y < b.y + b.height then
                return true
        else
                return false
        end
end

