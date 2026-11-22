# Interno: @s colocó stone. Descuenta, así poner y romper queda en cero.
# Puede quedar en negativo: si parara en 0, colocar stone con el contador en 0 saldría gratis.
scoreboard players operation #placed sm.calc = @s sm.placed
scoreboard players set @s sm.placed 0
# Construir en creativo no descuenta
execute if entity @s[gamemode=creative] run return 0
scoreboard players operation @s sm.valid -= #placed sm.calc
data modify storage secret_milestones:tmp place set value {}
execute store result storage secret_milestones:tmp place.id int 1 run scoreboard players get @s sm.id
function secret_milestones:milestone/stone_1m/on_place_run with storage secret_milestones:tmp place
