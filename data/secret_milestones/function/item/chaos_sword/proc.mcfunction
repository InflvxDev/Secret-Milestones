# Interno: salió el caos. Vuelve la probabilidad al inicio y elige el efecto
# (1 Wither, 2 Náusea, 3 Ceguera, 4 Lentitud II, 5 Debilidad).
scoreboard players operation @s sm.chaos = #chaos_base sm.calc
execute store result score #proc sm.calc run random value 1..5
