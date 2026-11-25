# GENERADO por tools/generate.py: no editar a mano
# Interno: {id}. Fila del panel
$execute store result storage secret_milestones:tmp row.done int 1 run data get storage secret_milestones:deep p$(id).done
$execute store result storage secret_milestones:tmp row.deepslate int 1 run data get storage secret_milestones:deep p$(id).deepslate
$execute store result storage secret_milestones:tmp row.tuff int 1 run data get storage secret_milestones:deep p$(id).tuff
$execute store result storage secret_milestones:tmp row.deepslate_diamond_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_diamond_ore
$execute store result storage secret_milestones:tmp row.deepslate_redstone_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_redstone_ore
$execute store result storage secret_milestones:tmp row.deepslate_gold_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_gold_ore
$execute store result storage secret_milestones:tmp row.deepslate_iron_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_iron_ore
$execute store result storage secret_milestones:tmp row.deepslate_copper_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_copper_ore
$execute store result storage secret_milestones:tmp row.deepslate_lapis_ore int 1 run data get storage secret_milestones:deep p$(id).deepslate_lapis_ore
$execute store result storage secret_milestones:tmp row.p_deepslate int 1 run data get storage secret_milestones:deep p$(id).placed_deepslate
$execute store result storage secret_milestones:tmp row.o_deepslate int 1 run data get storage secret_milestones:deep p$(id).over_deepslate
$execute store result storage secret_milestones:tmp row.p_tuff int 1 run data get storage secret_milestones:deep p$(id).placed_tuff
$execute store result storage secret_milestones:tmp row.o_tuff int 1 run data get storage secret_milestones:deep p$(id).over_tuff
function secret_milestones:gen/deep_progress_text with storage secret_milestones:tmp row
