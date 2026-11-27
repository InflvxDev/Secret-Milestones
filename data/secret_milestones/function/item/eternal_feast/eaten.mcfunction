# Interno: cada vez que @s termina de comer el Eternal Feast (lo llama gen/feast_refill, al tick siguiente).
# Probabilidad de #feast_boost milésimas (en load) de una bendición: un efecto bueno al azar, más fuerte que
# cualquier poción o ítem de vanilla, por 1 minuto.
execute store result score #r sm.calc run random value 0..999
execute if score #r sm.calc < #feast_boost sm.calc run function secret_milestones:item/eternal_feast/boost
