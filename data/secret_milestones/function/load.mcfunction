# Secret-Milestones - carga
scoreboard objectives add sm.calc dummy
# Detecta cuando un jugador vuelve a entrar
scoreboard objectives add sm.leave minecraft.custom:minecraft.leave_game
# Botones del panel de admin (solo funciona para quien abrió /function secret_milestones:menu)
scoreboard objectives add sm.admin trigger
# Ticks que le quedan al permiso del panel
scoreboard objectives add sm.time dummy
# Al arrancar o recargar se cierran todos los permisos, también los de desconectados
# (un cierre forzado no suma leave_game y el permiso quedaría guardado)
scoreboard players reset * sm.admin
scoreboard players reset * sm.time
# Panel: hitos que muestra, cuántos por página y constantes para los valores de los botones
function secret_milestones:milestone/registry
scoreboard players set #page sm.calc 8
scoreboard players set #10 sm.calc 10
scoreboard players set #100000 sm.calc 100000
# Id numérico de cada jugador (sale de su UUID) y si ya se guardó su nombre
scoreboard objectives add sm.id dummy
scoreboard objectives add sm.named dummy
# Hito 1: lo minado y colocado desde el último tick, y el progreso válido
scoreboard objectives add sm.mined minecraft.mined:minecraft.stone
scoreboard objectives add sm.placed minecraft.used:minecraft.stone
scoreboard objectives add sm.valid dummy
# Hito 2: tipos de mob matados con arco. La meta cambia con la versión del juego.
scoreboard objectives add sm.bow dummy
function secret_milestones:gen/bow_goal
# Hito 3: debris minado desde el último tick y progreso válido.
# Meta: 164 bloques de netherita x 9 lingotes x 4 de debris = 5904.
scoreboard objectives add sm.dmined minecraft.mined:minecraft.ancient_debris
scoreboard objectives add sm.debris dummy
scoreboard players set #16 sm.calc 16
# Cuánto debris le cuenta a cada jugador cada zona (medido: desde una se alcanzan 12 como mucho)
scoreboard players set #debris_cap sm.calc 16
# Debris Finder: lo tenía en la mano el tick anterior, y espera del radar
scoreboard objectives add sm.held dummy
scoreboard objectives add sm.radar dummy
# Hito 4: tesoros pescados en aguas abiertas
scoreboard objectives add sm.fish dummy
# Hito 5: lo más lejos que llegó cada jugador del centro (X o Z), y la meta.
# El borde del mundo vanilla está en 29999984: 29999900 es llegar a verlo.
scoreboard objectives add sm.far dummy
scoreboard players set #farlands sm.calc 29999900
# Farlands Explorer: las tenía puestas el tick anterior
scoreboard objectives add sm.worn dummy
# Hito 6: lo crafteado de cada componente desde el último segundo, y cuántos llegaron a 1000
function secret_milestones:gen/red_load
scoreboard objectives add sm.red dummy
# RedKeyStone: clic derecho con la caña con zanahoria y espera entre giros
scoreboard objectives add sm.wrench minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add sm.wcd dummy
# Hito 7: ticks vivo desde la última muerte (solo conectado), y muertes desde el último segundo.
# Meta: 1000 días de 24000 ticks.
scoreboard objectives add sm.life dummy
scoreboard objectives add sm.died deathCount
scoreboard players set #life_goal sm.calc 24000000
scoreboard players set #24000 sm.calc 24000
# Anti-AFK: segundos sin girar la cámara (y la última cámara vista) antes de que deje de sumar
scoreboard objectives add sm.afk dummy
scoreboard objectives add sm.yaw dummy
scoreboard objectives add sm.pitch dummy
scoreboard players set #afk_limit sm.calc 120
# Kars Totem: en qué mano está (1 principal, 2 segunda) y si estaba en la segunda el tick anterior
scoreboard objectives add sm.khand dummy
scoreboard objectives add sm.koff dummy
# Hito 8: troncos talados y colocados de cada tipo, el total del tick, de qué tipo era y el progreso válido
function secret_milestones:gen/log_load
scoreboard objectives add sm.lmined dummy
scoreboard objectives add sm.lkind dummy
scoreboard objectives add sm.log dummy
# Cuántos troncos le cuenta a cada jugador cada zona de 16x16x16, y cuántos tala el Woodozer de una vez
scoreboard players set #log_cap sm.calc 1000
scoreboard players set #fell_cap sm.calc 256
# Hito 9: lo minado y colocado de cada bloque, cuántos llegaron a su meta, y el cupo por zona
# de los que se pueden poner y romper (natural: el deepslate llena la zona, una mancha de tuff tiene ~600)
function secret_milestones:gen/deep_load
scoreboard objectives add sm.deep dummy
scoreboard players set #cap_deepslate sm.calc 5500
scoreboard players set #cap_tuff sm.calc 2000
# DeepMine Crown: la tenía puesta el tick anterior
scoreboard objectives add sm.crown dummy
# Hito 10: bloques blandos excavados y colocados de cada tipo, el total del tick y el progreso válido
function secret_milestones:gen/soil_load
scoreboard objectives add sm.smined dummy
scoreboard objectives add sm.soil dummy
# Cuántos bloques blandos le cuenta a cada jugador cada zona de 16x16x16
scoreboard players set #soil_cap sm.calc 2000
# Hito 11: lo movido agachado y corriendo (cm) y los saltos desde el último tick, y el progreso válido.
# Metas: 300 km agachado, 1000 km corriendo y 100.000 saltos (en milestone/check_all).
scoreboard objectives add sm.crouch minecraft.custom:minecraft.crouch_one_cm
scoreboard objectives add sm.sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add sm.jump minecraft.custom:minecraft.jump
scoreboard objectives add sm.mc dummy
scoreboard objectives add sm.ms dummy
scoreboard objectives add sm.mj dummy
# Cuántos saltos le cuenta a cada jugador cada zona de 16x16x16
scoreboard players set #jump_cap sm.calc 500
# Dash Shadow: espera entre dashes, ventana del doble espacio (ticks), y el estado de cada jugador:
# espacio el tick anterior, ventana abierta, ya dasheó en este salto, dirección, tramo de cámara y su vida
scoreboard players set #dash_cd sm.calc 30
scoreboard players set #dash_window sm.calc 7
scoreboard players set #3 sm.calc 3
scoreboard objectives add sm.dcd dummy
scoreboard objectives add sm.jprev dummy
scoreboard objectives add sm.dtap dummy
scoreboard objectives add sm.dair dummy
scoreboard objectives add sm.dgo dummy
scoreboard objectives add sm.dpb dummy
scoreboard objectives add sm.dgt dummy
# Hito 12: daño recibido antes de la armadura, en décimas de vida (1 corazón = 20), de cada tipo:
# golpes, proyectiles, explosiones, fuego y lava, y jefes. Metas en milestone/check_all.
scoreboard objectives add sm.hmel dummy
scoreboard objectives add sm.hpro dummy
scoreboard objectives add sm.hexp dummy
scoreboard objectives add sm.hfir dummy
scoreboard objectives add sm.hbos dummy
scoreboard players set #20 sm.calc 20
# Cuánto daño le cuenta a cada jugador cada zona de 16x16x16 (en décimas: 5000 = 250 corazones; 0 = sin cupo)
scoreboard players set #hcap_mel sm.calc 5000
scoreboard players set #hcap_pro sm.calc 5000
scoreboard players set #hcap_exp sm.calc 5000
scoreboard players set #hcap_fir sm.calc 1000
scoreboard players set #hcap_bos sm.calc 0
# Aegis Heart: la tenía puesta el tick anterior
scoreboard objectives add sm.aworn dummy
# Hito 13: Españita Chaos Sword. La tenía en la mano el tick anterior, y su probabilidad de caos en milésimas:
# empieza en #chaos_base, sube #chaos_step por cada golpe sin suerte hasta #chaos_max, y al salir vuelve a empezar.
scoreboard objectives add sm.sheld dummy
scoreboard objectives add sm.chaos dummy
scoreboard players set #chaos_base sm.calc 2
scoreboard players set #chaos_step sm.calc 2
scoreboard players set #chaos_max sm.calc 50
# Hito 14: lo cosechado de cada cultivo desde el último tick, y cuántos llegaron a su meta (metas en tools/generate.py)
function secret_milestones:gen/harvest_load
scoreboard objectives add sm.harv dummy
scoreboard players set #2 sm.calc 2
scoreboard players set #-1 sm.calc -1
# Thorfinn Harvest: hasta cuántos bloques del cultivo clicado llega la cadena, y el estado de cada
# boomerang (ola de cada marker, ida o vuelta, ticks en el aire)
scoreboard players set #harvest_reach sm.calc 12
scoreboard objectives add sm.hg dummy
scoreboard objectives add sm.hbs dummy
scoreboard objectives add sm.hage dummy
scoreboard objectives add sm.huse dummy
# Hito 15: Españita Chaos Mace. Probabilidad de caos de cada golpe pesado, en milésimas (como la espada, más alta
# porque los golpes pesados son pocos): empieza en #mchaos_base, sube #mchaos_step por golpe sin suerte hasta #mchaos_max.
# En promedio sale cada unos 10 golpes pesados. #mchaos_lift: fuerza hacia arriba con la que salen los mobs (milésimas).
scoreboard objectives add sm.mchaos dummy
scoreboard players set #mchaos_base sm.calc 15
scoreboard players set #mchaos_step sm.calc 15
scoreboard players set #mchaos_max sm.calc 250
scoreboard players set #mchaos_lift sm.calc 1100
# Cuánto stone le cuenta a cada jugador cada zona de 16x16x16
scoreboard players set #cap sm.calc 5500
execute unless data storage secret_milestones:players list run data modify storage secret_milestones:players list set value []
# Una sola vez: devuelve lo que la versión anterior restó por colocar
execute unless data storage secret_milestones:db {refunded:1b} run function secret_milestones:milestone/stone_1m/refund

# Quién cobró cada hito, por UUID (así no se repite al cambiar de nick)
execute unless data storage secret_milestones:claimed stone_1m run data modify storage secret_milestones:claimed stone_1m set value []
execute unless data storage secret_milestones:claimed bow_all run data modify storage secret_milestones:claimed bow_all set value []
execute unless data storage secret_milestones:claimed debris_beacon run data modify storage secret_milestones:claimed debris_beacon set value []
execute unless data storage secret_milestones:claimed treasure_500 run data modify storage secret_milestones:claimed treasure_500 set value []
execute unless data storage secret_milestones:claimed farlands run data modify storage secret_milestones:claimed farlands set value []
execute unless data storage secret_milestones:claimed redstone_1000 run data modify storage secret_milestones:claimed redstone_1000 set value []
execute unless data storage secret_milestones:claimed life_1000 run data modify storage secret_milestones:claimed life_1000 set value []
execute unless data storage secret_milestones:claimed log_100k run data modify storage secret_milestones:claimed log_100k set value []
execute unless data storage secret_milestones:claimed deep_mine run data modify storage secret_milestones:claimed deep_mine set value []
execute unless data storage secret_milestones:claimed soil_250k run data modify storage secret_milestones:claimed soil_250k set value []
execute unless data storage secret_milestones:claimed movement run data modify storage secret_milestones:claimed movement set value []
execute unless data storage secret_milestones:claimed hurt run data modify storage secret_milestones:claimed hurt set value []
execute unless data storage secret_milestones:claimed armor_set run data modify storage secret_milestones:claimed armor_set set value []
execute unless data storage secret_milestones:claimed harvest run data modify storage secret_milestones:claimed harvest set value []
execute unless data storage secret_milestones:claimed tool_set run data modify storage secret_milestones:claimed tool_set set value []

execute as @a run function secret_milestones:player/login
