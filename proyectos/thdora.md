# thdora — Bot Telegram + FastAPI

> Repo: [github.com/alvarofernandezmota-tech/thdora](https://github.com/alvarofernandezmota-tech/thdora)
> Última revisión: 13 junio 2026

---

## Qué es

Bot de Telegram con backend FastAPI. Parte del ecosistema THEA IA.

| Stack | Detalle |
|---|---|
| Bot | python-telegram-bot |
| API | FastAPI, puerto 8001 |
| DB | SQLite (volumen Docker persistente) |
| LLM | Groq API (llama3-8b-8192) — Ollama local pendiente |
| Deploy | Docker Compose (2 contenedores: api + bot) |

---

## Estado

| Item | Estado |
|---|---|
| Repo estructurado | ✅ |
| Dockerfile + docker-compose.yml | ✅ |
| .env.example documentado | ✅ |
| Keys en repo | ❌ NO (bien protegido, .gitignore) |
| Desplegado en Madre | ⏳ Pendiente |
| Ollama local integrado | ⏳ Pendiente |

---

## Variables de entorno necesarias

```bash
TELEGRAM_BOT_TOKEN=   # recuperar desde @BotFather en Telegram → /mybots
GROQ_API_KEY=         # generar nueva en console.groq.com (la anterior caducada/perdida)
THDORA_API_URL=http://api:8000   # no cambiar en Docker
```

> ⚠️ Las keys antiguas se perdieron al borrar Windows. Hay que regenerar ambas.
> - **GROQ**: [console.groq.com](https://console.groq.com) → API Keys → Create API Key
> - **TELEGRAM**: Telegram → @BotFather → `/mybots` → seleccionar bot → API Token

---

## Despliegue en Madre

```bash
# Desde Acer
ssh madre

# Clonar repo
git clone https://github.com/alvarofernandezmota-tech/thdora.git ~/proyectos/thdora
cd ~/proyectos/thdora

# Configurar .env
cp .env.example .env
nano .env   # pegar TELEGRAM_BOT_TOKEN y GROQ_API_KEY

# Arrancar
docker compose up -d

# Verificar
docker compose ps
docker compose logs -f
```

---

## Comandos útiles

```bash
# Ver estado
docker compose ps

# Ver logs en tiempo real
docker compose logs -f

# Reiniciar
docker compose restart

# Parar
docker compose down

# Consola SQLite
docker compose exec api sqlite3 /app/data/thdora.db
```

---

## Pendiente
- [ ] Regenerar GROQ_API_KEY en console.groq.com
- [ ] Recuperar TELEGRAM_BOT_TOKEN desde @BotFather
- [ ] Instalar Docker en Madre (verificar si está instalado)
- [ ] Desplegar con `docker compose up -d`
- [ ] Integrar Ollama local (sustituir Groq por modelo local en Madre)
- [ ] Crear `proyectos/thdora.md` en personal-v2 con estado actualizado post-deploy

---

_Ver también: [arquitectura.md](../arquitectura.md) · [setup/servidor/README.md](../setup/servidor/README.md)_
