# Panel de admin: /function secret_milestones:menu (requiere OP)
# Marca a @s como admin hasta que salga del servidor: así los botones del panel
# pueden usar /trigger sm.admin (sin la pantalla de "Confirm Command Execution").
tag @s add sm.admin
scoreboard players enable @s sm.admin
data remove storage secret_milestones:tmp status
function secret_milestones:admin/main
