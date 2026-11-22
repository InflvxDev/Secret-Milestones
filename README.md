# Secret-Milestones

Secretos e easter eggs para SMP (Minecraft 26.3 y 26.4) que dan recompensas al alcanzar hitos.

**Spoilers:** este archivo revela los secretos.

## Hitos
| # | Hito | Recompensa |
|---|---|---|
| 1 | Minar 1.000.000 de piedra (`minecraft:stone`) | **Chunk Destroyer Infinitum**: pico de netherita irrompible con Eficiencia X y Toque de seda |

- Cada jugador cobra cada hito **una sola vez**.
- **Cuenta desde que se instala** el datapack: todos empiezan en 0.
- Solo cuenta `stone`: no deepslate, granito, cobblestone ni otras variantes. En creativo no suma.
- El aviso solo lo ve quien lo consigue.
- Con el inventario lleno, muerto o en espectador, la recompensa queda esperando.

## Contra los generadores de stone
- **Cupo por zona:** cada zona de 16x16x16 (según dónde está parado el jugador) le cuenta hasta 5500 stone a cada jugador. En una zona natural caben 4096 bloques. Un generador fijo deja de sumar a los 5500, sin avisar.
- **Colocar descuenta:** cada stone colocada resta una, así poner y romper queda en cero. El contador puede quedar en negativo. Construir en creativo no resta.
- El cupo se cambia en `load` (`#cap`). Cambia también el texto de `admin/progress`.

## Panel de admin
`/function secret_milestones:menu` (requiere OP)

- **Obtener recompensa:** te da solo el pico.
- **Ver progreso:** por jugador, también desconectado: stone válidas, minadas, colocadas y fuera de cupo.
- **Probar hito:** cierra el panel y reproduce lo que verá el jugador, con el pico incluido.

Probar las recompensas no marca el hito como conseguido. Los botones solo funcionan para quien abrió el panel, hasta que sale del servidor o se usa `/reload`.

## Notas
- Con **Wearbound**, el pico necesita el tier de diamante desbloqueado, como cualquier pico de netherita.
- En el yunque, un libro de Eficiencia lo baja a Eficiencia V (regla de vanilla).
- Desinstalar: `/function secret_milestones:uninstall` y después quitar el datapack. Se conservan el progreso, los cupos y quién cobró, por si se reinstala.

## Agregar un hito
1. La condición: un score (como `sm.valid`) o un predicate.
2. `function/reward/<recompensa>.mcfunction`: el premio.
3. `function/milestone/<hito>/`: copia `stone_1m` y cambia los nombres.
4. Una línea en `milestone/check_all` y su lista en `load`.
5. Vista previa y botones (21 y 22 para el hito 2) en `admin/main`, y sus acciones en `admin/trigger`.

El ícono se genera con `python tools/icon.py`.
