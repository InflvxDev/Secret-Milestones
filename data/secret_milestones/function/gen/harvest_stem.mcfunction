# GENERADO por tools/generate.py: no editar a mano
# Interno: {s, a}. En el hueco de un fruto roto: #st = 1 si al lado está su tallo
# (crecido, o todavía mirándolo). Así solo cuentan los que crecieron, no la decoración.
scoreboard players set #st sm.calc 0
$execute if block ~1 ~ ~ minecraft:$(s)[age=7] run scoreboard players set #st sm.calc 1
$execute if block ~1 ~ ~ minecraft:$(a)[facing=west] run scoreboard players set #st sm.calc 1
$execute if block ~-1 ~ ~ minecraft:$(s)[age=7] run scoreboard players set #st sm.calc 1
$execute if block ~-1 ~ ~ minecraft:$(a)[facing=east] run scoreboard players set #st sm.calc 1
$execute if block ~ ~ ~1 minecraft:$(s)[age=7] run scoreboard players set #st sm.calc 1
$execute if block ~ ~ ~1 minecraft:$(a)[facing=north] run scoreboard players set #st sm.calc 1
$execute if block ~ ~ ~-1 minecraft:$(s)[age=7] run scoreboard players set #st sm.calc 1
$execute if block ~ ~ ~-1 minecraft:$(a)[facing=south] run scoreboard players set #st sm.calc 1
