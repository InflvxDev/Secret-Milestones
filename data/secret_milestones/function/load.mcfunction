# Secret-Milestones - carga
scoreboard objectives add sm.calc dummy
# Detecta cuando un jugador vuelve a entrar
scoreboard objectives add sm.leave minecraft.custom:minecraft.leave_game
# Botones del panel de admin (solo funciona para quien abrió /function secret_milestones:menu)
scoreboard objectives add sm.admin trigger
# Id numérico de cada jugador (sale de su UUID) y si ya se guardó su nombre
scoreboard objectives add sm.id dummy
scoreboard objectives add sm.named dummy
# Hito 1: lo minado y colocado desde el último tick, y el progreso válido
scoreboard objectives add sm.mined minecraft.mined:minecraft.stone
scoreboard objectives add sm.placed minecraft.used:minecraft.stone
scoreboard objectives add sm.valid dummy
# Cuánto stone le cuenta a cada jugador cada zona de 16x16x16
scoreboard players set #cap sm.calc 5500
execute unless data storage secret_milestones:players list run data modify storage secret_milestones:players list set value []

# Quién cobró cada hito, por UUID (así no se repite al cambiar de nick)
execute unless data storage secret_milestones:claimed stone_1m run data modify storage secret_milestones:claimed stone_1m set value []

execute as @a run function secret_milestones:player/login
