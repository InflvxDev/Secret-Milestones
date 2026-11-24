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

execute as @a run function secret_milestones:player/login
