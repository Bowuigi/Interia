-- Interia
-- Motor e interprete de historias interactivas
-- Hecho en Lua
-- Por Mateo Crimella (También conocido como Bowuigi)
-- Registrado bajo la licencia GNU GPLv3

S = require("suit")
P = require("parser")
U = require("utils")

function love.load()
	font = 
	Parsedt = P.parse(U.readFrom(io.stdin))
end

function love.update()
	for i,v in ipairs(Parsedt["seccion_1"].content) do
		S.Label(v, {align = "left"},10,i*10)
	end
end

function love.draw()
	S.draw()
end

function love.textinput(t)
    S.textinput(t)
end

function love.keypressed(key)
    S.keypressed(key)
end

