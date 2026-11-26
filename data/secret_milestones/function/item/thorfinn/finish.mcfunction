# Interno: {own}. El boomerang volvió (o se cortó): deja lo cosechado a los pies del jugador y limpia la cadena.
$tp @e[type=minecraft:item,tag=sm.hl,scores={sm.id=$(own)}] @a[scores={sm.id=$(own)},limit=1]
$tag @e[type=minecraft:item,tag=sm.hl,scores={sm.id=$(own)}] remove sm.hl
$kill @e[type=minecraft:marker,tag=sm.hx,scores={sm.id=$(own)}]
$kill @e[type=minecraft:marker,tag=sm.ht,scores={sm.id=$(own)}]
$execute as @a[scores={sm.id=$(own)},limit=1] at @s run playsound minecraft:item.trident.return player @a ~ ~ ~ 1 1
kill @s
