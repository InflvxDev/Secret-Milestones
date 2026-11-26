# Interno: cada tick, para quien lleva los Dash Shadow puestos en survival o aventura.
# Dash: espacio dos veces seguidas (#dash_window ticks en load) con una tecla WASD apretada.
# Aquí solo se elige la dirección (sm.dgo) y el tramo de la cámara (sm.dpb): el empuje lo da
# el encantamiento secret_milestones:dash de los pantalones (enchantment/dash.json).
scoreboard players remove @s[scores={sm.dcd=1..}] sm.dcd 1
scoreboard players remove @s[scores={sm.dtap=1..}] sm.dtap 1
# Un dash por salto: se recarga al tocar el suelo
execute if predicate secret_milestones:on_ground run scoreboard players set @s sm.dair 0
# Solo cuenta cuando empieza a apretar el espacio: mantenerlo apretado no dashea
execute store success score #jk sm.calc if predicate secret_milestones:input/jump
execute if score #jk sm.calc matches 1 unless score @s sm.jprev matches 1 run function secret_milestones:item/dash_shadow/tap
scoreboard players operation @s sm.jprev = #jk sm.calc
