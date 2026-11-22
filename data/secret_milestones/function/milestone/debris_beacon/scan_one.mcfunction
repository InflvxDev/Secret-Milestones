# Interno: {d, kx, ky, kz, x, y, z}. Sin chunk cargado no se puede saber: se deja.
$execute in $(d) if loaded $(x) $(y) $(z) unless block $(x) $(y) $(z) minecraft:ancient_debris run function secret_milestones:milestone/debris_beacon/consume with storage secret_milestones:tmp near
