# Panel de admin: /function secret_milestones:menu (requiere OP)
# Marca a @s como admin por 2 minutos desde el último botón: así los botones del panel
# pueden usar /trigger sm.admin (sin la pantalla de "Confirm Command Execution").
execute unless function secret_milestones:admin/grant run return fail
data remove storage secret_milestones:tmp status
function secret_milestones:admin/main
