# Jugador nuevo o que volvió a entrar
execute as @a unless score @s sm.leave matches 0 run function secret_milestones:player/login

# Botones del panel de admin (van por /trigger, así no sale la confirmación de comandos)
execute as @a[scores={sm.admin=1..}] run function secret_milestones:admin/trigger
execute as @a[tag=sm.admin] run function secret_milestones:admin/session

# Hito 1: solo corre para quien minó o colocó stone en este tick
execute as @a[scores={sm.placed=1..}] run function secret_milestones:milestone/stone_1m/on_place
execute as @a[scores={sm.mined=1..}] run function secret_milestones:milestone/stone_1m/on_mine
# Hito 3: solo corre para quien minó debris en este tick
execute as @a[scores={sm.dmined=1..}] run function secret_milestones:milestone/debris_beacon/on_mine
# Hito 8: solo corre para quien taló troncos en este tick (y ahí el Woodozer tala el árbol)
function secret_milestones:gen/log_mined
execute as @a[scores={sm.lmined=1..}] run function secret_milestones:milestone/log_100k/on_mine
# Hito 9: solo corre para quien minó deepslate, tuff o menas de deepslate en este tick
function secret_milestones:gen/deep_mined
# Hito 10: solo corre para quien excavó bloques blandos en este tick (y ahí atrae la Terra Magnet)
function secret_milestones:gen/soil_mined
execute as @a[scores={sm.smined=1..}] run function secret_milestones:milestone/soil_250k/on_mine

# Los hitos se revisan una vez por segundo
scoreboard players add #t sm.calc 1
execute if score #t sm.calc matches 20.. run function secret_milestones:milestone/check_all

# Debris Finder (va después de la revisión: #t vale 0 una vez por segundo)
scoreboard players remove @a[scores={sm.held=1..}] sm.held 1
scoreboard players remove @a[scores={sm.radar=1..}] sm.radar 1
execute as @a[gamemode=!spectator] if items entity @s weapon.mainhand minecraft:netherite_pickaxe[minecraft:custom_data~{secret_milestones:"debris_finder"}] run function secret_milestones:item/debris_finder/hold
# Kars Totem: la mano se anota antes de que el juego revise los tótems (eso pasa después, al morir)
scoreboard players remove @a[scores={sm.koff=1..}] sm.koff 1
execute as @a store success score @s sm.khand if items entity @s weapon.mainhand minecraft:totem_of_undying[minecraft:custom_data~{secret_milestones:"kars_totem"}]
execute as @a[scores={sm.khand=0}] if items entity @s weapon.offhand minecraft:totem_of_undying[minecraft:custom_data~{secret_milestones:"kars_totem"}] run scoreboard players set @s sm.khand 2
execute as @a[gamemode=!spectator] if items entity @s weapon.offhand minecraft:totem_of_undying[minecraft:custom_data~{secret_milestones:"kars_totem"}] run function secret_milestones:item/kars_totem/hold
# RedKeyStone
scoreboard players remove @a[scores={sm.wcd=1..}] sm.wcd 1
execute as @a[scores={sm.wrench=1..}] run function secret_milestones:item/red_power/use
# DeepMine Crown (igual que las Farlands Explorer)
scoreboard players remove @a[scores={sm.crown=1..}] sm.crown 1
execute as @a[gamemode=!spectator] if items entity @s armor.head minecraft:netherite_helmet[minecraft:custom_data~{secret_milestones:"deepmine_crown"}] run function secret_milestones:item/deepmine_crown/wear
# Woodozer: después de la tala, anota a qué tronco apunta cada uno para el tick siguiente
kill @e[type=minecraft:marker,tag=sm.aim]
execute as @a[gamemode=!spectator,gamemode=!creative] if items entity @s weapon.mainhand minecraft:netherite_axe[minecraft:custom_data~{secret_milestones:"woodozer"}] unless predicate secret_milestones:sneaking at @s anchored eyes positioned ^ ^ ^ run function secret_milestones:item/woodozer/aim
# Farlands Explorer (igual que el Debris Finder, pero puestas)
scoreboard players remove @a[scores={sm.worn=1..}] sm.worn 1
execute as @a[gamemode=!spectator] if items entity @s armor.feet minecraft:netherite_boots[minecraft:custom_data~{secret_milestones:"farlands_explorer"}] run function secret_milestones:item/farlands_explorer/wear
