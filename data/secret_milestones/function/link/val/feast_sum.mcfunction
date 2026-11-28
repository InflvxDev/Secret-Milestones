# Interno: tmp lr {id}. Total comido (cada comida cuenta hasta su meta)
function secret_milestones:gen/feast_sum with storage secret_milestones:tmp lr
scoreboard players operation #lv sm.calc = #s sm.calc
