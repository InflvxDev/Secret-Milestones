# Interno: devuelve 1 si a @s le cuenta el movimiento: survival o aventura y sin AFK.
# sm.afk lo lleva life_1000/alive (segundos sin girar la cámara, #afk_limit en load).
execute if entity @s[gamemode=!survival,gamemode=!adventure] run return 0
execute if score @s sm.afk >= #afk_limit sm.calc run return 0
return 1
