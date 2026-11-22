# Interno: en un bloque de debris donde pudo quedar el colocado. El marker solo sirve
# para leer las coordenadas y se borra en el mismo comando.
execute align xyz summon minecraft:marker run function secret_milestones:milestone/debris_beacon/locate
function secret_milestones:milestone/debris_beacon/mark with storage secret_milestones:tmp pl
