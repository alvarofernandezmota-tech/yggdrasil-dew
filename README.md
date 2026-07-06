# 🧠 yggdrasil-dew

> 👁️ **Empieza siempre por [`DASHBOARD.md`](./DASHBOARD.md)** — una página con el estado de todos los planes activos.

> Cerebro técnico del ecosistema Yggdrasil.
> **DEW = CÓMO funciona y QUÉ se decidió. Nunca QUÉ existe (eso es WIKI).**

---

## ¿Qué es esto?

`yggdrasil-dew` es el repositorio de conocimiento técnico del ecosistema.
Contiene decisiones de arquitectura (ADRs), el canon del sistema, diarios de sesión y documentación transversal.

---

## 🗂️ Estructura

```
docs/
├── canon/          ← verdad única del ecosistema
│   ├── DICCIONARIO.md          ← glosario de términos
│   ├── ARBOL-SERVICIOS.md      ← todos los servicios por isla
│   ├── ADR-001-platform-stack.md ← por qué existe cada servicio
│   ├── galatea-template.md     ← cabecera estándar para scripts
│   └── ARBOL-AGENTES.md        ← mapa de agentes
├── diarios/        ← registro de cada sesión de trabajo
└── hallazgos/      ← hallazgos técnicos con evidencia
NORMAS.md           ← reglas globales WIKI / DEW / repos
```

---

## 📖 Canon — documentos clave

| Documento | Propósito |
|---|---|
| [`NORMAS.md`](NORMAS.md) | Regla global: qué va en cada repo |
| [`docs/canon/DICCIONARIO.md`](docs/canon/DICCIONARIO.md) | Glosario de términos del ecosistema |
| [`docs/canon/ARBOL-SERVICIOS.md`](docs/canon/ARBOL-SERVICIOS.md) | Todos los servicios, su isla y estado |
| [`docs/canon/ADR-001-platform-stack.md`](docs/canon/ADR-001-platform-stack.md) | Por qué existe cada servicio en Madre |
| [`docs/canon/galatea-template.md`](docs/canon/galatea-template.md) | Cabecera obligatoria para scripts |

---

## 🔗 Repos del ecosistema

| Repo | Propósito |
|---|---|
| [`WIKI---PERSONAL`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL) | Mapa conceptual: islas, relaciones |
| [`yggdrasil-dew`](https://github.com/alvarofernandezmota-tech/yggdrasil-dew) | Este repo — cerebro técnico |
| [`madre-config`](https://github.com/alvarofernandezmota-tech/madre-config) | Config y scripts del servidor Madre |
| [`yggdrasil-secops`](https://github.com/alvarofernandezmota-tech/yggdrasil-secops) | Seguridad: HAL issues, auditorías |
| [`thdora`](https://github.com/alvarofernandezmota-tech/thdora) | Bot Telegram personal |

---

## 📚 Normas

- Normas globales → [`NORMAS.md`](NORMAS.md)
- Normas de la wiki → [`WIKI---PERSONAL/wiki/CONVENCIONES.md`](https://github.com/alvarofernandezmota-tech/WIKI---PERSONAL/blob/main/wiki/CONVENCIONES.md)
- CI de validación → [`.github/workflows/validate-canon.yml`](.github/workflows/validate-canon.yml)
