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
# Hito 14: solo corre para quien cosechó en este tick (mira lo que soltó para saber si estaba maduro)
function secret_milestones:gen/harvest_mined
# Hito 11: cada tick, para revisar qué teclas aprieta mientras se mueve
execute as @a[scores={sm.crouch=1..}] run function secret_milestones:milestone/movement/crouch
execute as @a[scores={sm.sprint=1..}] run function secret_milestones:milestone/movement/sprint
execute as @a[scores={sm.jump=1..}] run function secret_milestones:milestone/movement/jump

# Eternal Feast: al comerlo queda una copia en la mano; se vuelve a llenar antes de sumar lo comido
execute as @a if items entity @s weapon.* minecraft:rabbit_stew[minecraft:custom_data~{secret_milestones:"eternal_feast",refill:1b}] run function secret_milestones:gen/feast_refill

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
# Dash Shadow: si el encantamiento no llegó a usar la dirección (se los quitó), se borra igual
scoreboard players remove @a[scores={sm.dgt=1..}] sm.dgt 1
scoreboard players set @a[scores={sm.dgt=0,sm.dgo=1..}] sm.dgo 0
# Thorfinn Harvest: el boomerang vuela, corta la cadena y vuelve (el lanzamiento va por advancement/thorfinn_use)
execute as @e[type=minecraft:item_display,tag=sm.hb] at @s run function secret_milestones:item/thorfinn/fly
# sm.huse: 2 mientras mantiene el clic derecho con la azada; baja a 0 al soltar (un lanzamiento por clic)
scoreboard players remove @a[scores={sm.huse=1..}] sm.huse 1
# Españita Chaos Trident: cada tridente nuevo se revisa una vez (agachado al lanzarlo sale con Propulsión).
# Los rayos van por enchantment/trident_chaos.json. Sin daño de caída hasta tocar el suelo (después de 10 ticks).
execute as @e[type=minecraft:trident,tag=!sm.tseen] run function secret_milestones:item/chaos_trident/thrown
scoreboard players remove @a[scores={sm.tcd=1..}] sm.tcd 1
scoreboard players remove @a[scores={sm.tfall=1..}] sm.tfall 1
execute as @a[scores={sm.tfall=1..90}] if predicate secret_milestones:on_ground run scoreboard players set @s sm.tfall 0
# Españita Chaos Sword (igual que el Debris Finder, con Fuerza II). El caos al golpear va por enchantment/chaos.json
scoreboard players remove @a[scores={sm.sheld=1..}] sm.sheld 1
execute as @a[gamemode=!spectator] if items entity @s weapon.mainhand minecraft:netherite_sword[minecraft:custom_data~{secret_milestones:"chaos_sword"}] run function secret_milestones:item/chaos_sword/hold
# Aegis Heart (igual que las Farlands Explorer, con Resistencia II)
scoreboard players remove @a[scores={sm.aworn=1..}] sm.aworn 1
execute as @a[gamemode=!spectator] if items entity @s armor.chest minecraft:netherite_chestplate[minecraft:custom_data~{secret_milestones:"aegis_heart"}] run function secret_milestones:item/aegis_heart/wear
# Dash Shadow en creativo no: ahí el doble espacio es para volar
execute as @a[gamemode=!spectator,gamemode=!creative] if items entity @s armor.legs minecraft:netherite_leggings[minecraft:custom_data~{secret_milestones:"dash_shadow"}] run function secret_milestones:item/dash_shadow/wear
