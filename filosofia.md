# Filosofía — Álvaro Fernández Mota

> Este archivo define los principios que guían todas las decisiones técnicas.
> No es negociable. Cualquier herramienta, servicio o setup debe cumplirlos.
> Última actualización: 12 junio 2026

---

## Principio 1 — Open Source, siempre

**Todo software del servidor y del ecosistema personal debe ser open source. Sin excepciones.**

Esto no es una preferencia. Es una condición.

- Si existe una alternativa open source que hace lo mismo → se usa esa.
- Si no existe alternativa open source → se construye o se espera.
- Software propietario en el servidor = inaceptable.

### Por qué

- **Control total** — sabes exactamente qué corre en tu máquina.
- **Auditable** — puedes leer el código. Puedes detectar puertas traseras.
- **Sin dependencias de terceros** — ninguna empresa puede apagarte el servicio.
- **Filosófico** — el conocimiento debe ser libre. El software también.
- **Profesional** — los mejores ingenieros de sistemas trabajan con open source.

---

## El stack open source completo (junio 2026)

| Capa | Herramienta | Alternativa propietaria evitada |
|---|---|---|
| OS | Arch Linux + Omarchy | Windows, macOS |
| Escritorio | Hyprland + Wayland | Windows UI, Aqua |
| Periféricos compartidos | Input Leap | Synergy Pro (pago) |
| LLM local | Ollama | OpenAI API, Azure AI |
| Interfaz IA | Open WebUI | ChatGPT, Claude web |
| Firewall | nftables / ufw | — |
| Gestión servicios | systemd | — |
| Contenedores | Docker + Compose | — |
| Base de datos | PostgreSQL | MySQL Enterprise, MSSQL |
| Sync nube | rclone | Google Drive cliente nativo |
| VPN | WireGuard | NordVPN, ExpressVPN |
| DNS / privacidad | Pi-hole | — |
| Control versiones | Git + GitHub | GitLab (auto-hosteable también) |
| Detección intrusos | fail2ban | — |
| Logs | journald | Datadog, Splunk |
| Diagramas | Mermaid.js | Lucidchart, draw.io (propietario) |
| Bot personal | THDORA (Python propio) | — |
| Agente IA | Perplexity + Gemini (capa externa) | Solución única propietaria |

---

## Principio 2 — Control de tus propios datos

- Los datos personales no se almacenan en servidores de terceros si existe alternativa.
- Google Drive → backup secundario. La fuente de verdad es el repo Git.
- LLM local (Ollama) para razonar sobre datos sensibles → nunca cloud.
- Nextcloud como alternativa a Google Drive cuando esté operativo.

---

## Principio 3 — Todo bajo control de versiones

- Cada archivo de configuración del servidor vive en este repo.
- Ningún cambio sin commit. Ningún commit sin mensaje descriptivo.
- Si no está en Git, no existe.

---

## Principio 4 — Auditable y seguro por diseño

- Zero Trust: bloquear todo, permitir solo lo necesario.
- Saber siempre quién entra y cuándo (journald + fail2ban).
- Cifrado en tránsito para todo servicio que cruza la red.
- Revisar logs semanalmente.

---

## Principio 5 — Simplicidad antes que sofisticación

- Un servicio que entiendas completamente vale más que diez que no controlas.
- Fase 1 siempre: que funcione. Fase 2: que sea seguro. Fase 3: que sea elegante.
- No añadir servicios nuevos hasta que los existentes estén estables.

---

_"Un programador puro y duro no necesita que nadie le dé permiso para construir su infraestructura. La construye él mismo, con herramientas libres, y la entiende de arriba abajo."_
