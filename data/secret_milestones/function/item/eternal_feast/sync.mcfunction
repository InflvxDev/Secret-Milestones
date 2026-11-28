# Interno: cada tick después de comer el Eternal Feast (sm.fsync, lo pone gen/feast_refill).
# El cliente predice el final de comer y a veces lo hace después de que el servidor ya lo volvió a llenar,
# y se queda viendo un cuenco vacío aunque en el servidor está bien (al tirarlo vuelve a verse). El servidor
# solo vuelve a mandar el ítem si cambia, así que a los 4 y a los 20 ticks le cambia un dato oculto (sync).
scoreboard players remove @s sm.fsync 1
execute if score @s sm.fsync matches 16 if items entity @s weapon.mainhand minecraft:rabbit_stew[minecraft:custom_data~{secret_milestones:"eternal_feast"}] run item modify entity @s weapon.mainhand {function:"minecraft:set_custom_data",tag:{sync:1b}}
execute if score @s sm.fsync matches 16 if items entity @s weapon.offhand minecraft:rabbit_stew[minecraft:custom_data~{secret_milestones:"eternal_feast"}] run item modify entity @s weapon.offhand {function:"minecraft:set_custom_data",tag:{sync:1b}}
execute if score @s sm.fsync matches 0 if items entity @s weapon.mainhand minecraft:rabbit_stew[minecraft:custom_data~{secret_milestones:"eternal_feast"}] run item modify entity @s weapon.mainhand {function:"minecraft:set_custom_data",tag:{sync:0b}}
execute if score @s sm.fsync matches 0 if items entity @s weapon.offhand minecraft:rabbit_stew[minecraft:custom_data~{secret_milestones:"eternal_feast"}] run item modify entity @s weapon.offhand {function:"minecraft:set_custom_data",tag:{sync:0b}}
