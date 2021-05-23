-- Interia
-- Motor e interprete de historias interactivas
-- Hecho en Lua
-- Por Mateo Crimella (También conocido como Bowuigi)
-- Registrado bajo la licencia GNU GPLv3

-- Utilidades

local util = {}

function util.readFrom(stream)
	local tmp = {}
	local i = 1
	for line in stream:lines() do
		tmp[i]=line
		i=i+1
	end
	return tmp
end

function util.isSection(str)
	return ((str:sub(1,1) ~= "\t") and (str:sub(-1,-1) == ":"))
end

function util.isTitle(str)
	return (str:sub(2,2) == "#")
end

function util.isLink(str)
	return (str:sub(2,2) == "@")
end

return util

