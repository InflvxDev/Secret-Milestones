# Interno: devuelve 1 si a @s le queda un espacio libre (Inventory son los 36 espacios principales)
execute store result score #slots sm.calc run data get entity @s Inventory
execute if score #slots sm.calc matches ..35 run return 1
return 0
