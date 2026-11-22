# Secret-Milestones

Secretos e easter eggs para SMP (Minecraft 26.3 y 26.4) que dan recompensas al alcanzar hitos.

**Spoilers:** este archivo revela los secretos.

## Hitos
| # | Hito | Recompensa |
|---|---|---|
| 1 | Minar 1.000.000 de piedra (`minecraft:stone`) | **Chunk Destroyer Infinitum**: pico de netherita irrompible con Eficiencia X y Toque de seda |

- Cada jugador cobra cada hito **una sola vez**.
- Se usa la estadística del juego, así que **cuenta lo minado antes de instalar** el datapack. Quien ya pasó la meta cobra al conectarse.
- Solo cuenta `stone`: no deepslate, granito, cobblestone ni otras variantes. En creativo no suma.
- El aviso solo lo ve quien lo consigue.
- Con el inventario lleno, muerto o en espectador, la recompensa queda esperando.

## Panel de admin
`/function secret_milestones:menu` (requiere OP)

- **Obtener recompensa:** te da solo el pico.
- **Probar hito:** cierra el panel y reproduce lo que verá el jugador, con el pico incluido.

Ninguno de los dos marca el hito como conseguido. Los botones solo funcionan para quien abrió el panel, hasta que sale del servidor o se usa `/reload`.

## Notas
- Con **Wearbound**, el pico necesita el tier de diamante desbloqueado, como cualquier pico de netherita.
- En el yunque, un libro de Eficiencia lo baja a Eficiencia V (regla de vanilla).
- Desinstalar: `/function secret_milestones:uninstall` y después quitar el datapack. Se conserva el registro de quién cobró, para no repetir premios al reinstalar.

## Agregar un hito
1. `predicate/<hito>.json`: la condición.
2. `function/reward/<recompensa>.mcfunction`: el premio.
3. `function/milestone/<hito>/`: copia `stone_1m` y cambia los nombres.
4. Una línea en `milestone/check_all` y su lista en `load`.
5. Vista previa y botones (21 y 22 para el hito 2) en `admin/main`, y sus acciones en `admin/trigger`.

El ícono se genera con `python tools/icon.py`.
