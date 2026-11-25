# Interno: en @s, que acaba de excavar bloques blandos con la Terra Magnet.
# Atrae los ítems recién caídos (Age 0 o 1) de la lista blanda (tags/item/soil). Los tirados con Q tienen Thrower: no se tocan.
# Lo que no entra en el inventario queda a sus pies.
tag @s add sm.magnet
execute as @e[type=minecraft:item,distance=..8] unless data entity @s Thrower if items entity @s contents #secret_milestones:soil if data entity @s {Age:0s} run function secret_milestones:item/terra_magnet/grab
execute as @e[type=minecraft:item,distance=..8] unless data entity @s Thrower if items entity @s contents #secret_milestones:soil if data entity @s {Age:1s} run function secret_milestones:item/terra_magnet/grab
tag @s remove sm.magnet
