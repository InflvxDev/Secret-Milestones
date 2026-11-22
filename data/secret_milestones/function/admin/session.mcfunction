# Interno: cada tick, para quien tiene el permiso del panel.
# Un datapack no puede saber si sigue siendo OP, por eso el permiso caduca.
scoreboard players remove @s sm.time 1
execute unless score @s sm.time matches 1.. run function secret_milestones:admin/revoke
