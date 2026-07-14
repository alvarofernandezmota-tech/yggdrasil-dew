---
tipo: protocolo
subtipo: seguridad
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-01-01
actualizado: 2026-07-14
ruta: protocolo/PROTOCOLO-SECRETOS.md
tags: [protocolo, seguridad, secretos, credenciales, agente-ia, auditoria]
status: vigente
version: 2.0
audiencia: [humano, agente-ia]
nivel-escalado: 0 — Manual
candidato-a: 2 — GitHub Action
---

# 🔐 PROTOCOLO DE SECRETOS v2

> **Propósito:** Definir cómo se gestionan, almacenan, rotan y auditan los secretos (API keys, tokens, contraseñas, certificados) en el ecosistema Yggdrasil.
> **Ley máxima:** Ningún secreto va en ningún repo, en ningún commit, en ningún archivo de texto plano que no sea `.env` (y `.env` nunca se commitea).

---

## 👤 PARA EL HUMANO

### La regla de los tres NOs

1. **NO** commitear secretos — nunca, ni en un commit que luego borras
2. **NO** loggear secretos — ni en `console.log`, ni en archivos de log
3. **NO** pasar secretos como argumentos de CLI** — aparecen en el historial de la shell

### Dónde van los secretos

| Tipo de secreto | Dónde va | Cómo se accede |
|----------------|----------|----------------|
| Variables de entorno locales | `.env` (nunca commiteado) | `process.env.VAR` / `os.environ['VAR']` |
| Secrets de CI/CD | GitHub Secrets del repo | `${{ secrets.VAR }}` en workflows |
| Credenciales de producción | Variables de entorno del servidor | Inyectadas en el deploy |
| API keys compartidas del ecosistema | `madre-config` (vault local) | Referencia en `PROTOCOLO-LOCAL-BRAIN.md` |
| Certificados SSL/TLS | `/etc/ssl/` en el servidor | Nunca en el repo |

### Si commiteas un secreto por error

**Actuar en los siguientes 5 minutos:**

1. Revocar el secreto inmediatamente en el proveedor (GitHub, AWS, Google Cloud, etc.)
2. Generar uno nuevo
3. Ejecutar `PROTOCOLO-ROTACION-SECRETOS.md`
4. Si el repo es público: contactar con el proveedor para confirmar que no fue usado
5. Limpiar el historial de git (no borra el problema si ya fue pusheado — el daño está hecho)

### Antes de hacer push — checklist obligatorio

```bash
# Verificación manual rápida
git diff --staged | grep -iE "password|secret|token|api_key|apikey|private_key|passwd"
```

Si aparece algo → no hacer push y resolver primero.

---

## 🤖 PARA EL AGENTE IA

> **CONTRATO:** El agente NUNCA debe:
> - Leer, mostrar ni loggear el valor de un secreto (solo confirmar que existe)
> - Sugerir hardcodear un secreto en código
> - Commitear o añadir al staging area archivos que contengan secretos
> - Propagar un secreto de un repo a otro

### Verificación de secretos antes de cualquier commit

Antes de hacer `git add` + `git commit` en cualquier repo:

**PASO 1** — Verificar `.gitignore`
```
¿El .gitignore incluye estas entradas?
  .env
  .env.*
  *.pem
  *.key
  *.p12
  secrets/
  credentials.json
  config/local.yml
```
Si falta alguna → añadirla antes de continuar.

**PASO 2** — Escanear diff staged
Analizar el diff de los archivos staged buscando patrones:
- `password`, `passwd`, `pwd` seguido de `=` o `:`
- `secret`, `token`, `api_key`, `apikey` seguido de `=` o `:`
- `private_key`, `private key`
- Strings que parecen tokens (longitud > 20, caracteres mixtos alfanuméricos con guiones)
- Rutas a archivos `.pem`, `.key`, `.p12`

**PASO 3** — Verificar archivos `.env.example`
Si el repo tiene `.env.example`, verificar que:
- Todos los valores son placeholders (`TU_API_KEY_AQUI`, `CAMBIAR_ESTO`)
- No hay valores reales ni parciales

**PASO 4** — Declaración
```
[VERIFICACIÓN SECRETOS]
Archivos staged: [N]
Patrones de secretos detectados: ✅ NINGUNO / ❌ DETECTADOS: [lista]
.gitignore completo: ✅ / ❌ Faltan: [lista]
.env.example limpio: ✅ / ❌ / N/A
Veredicto: SEGURO PARA COMMIT / ❌ BLOQUEAR COMMIT
```

### Ante un secreto expuesto (gestión de incidente)

Si el agente detecta un secreto en código ya commiteado:

1. **Notificar al usuario inmediatamente** — no actuar solo
2. **No propagar** — no leer ni copiar el valor del secreto
3. **Esperar instrucciones** — el usuario ejecuta `PROTOCOLO-ROTACION-SECRETOS.md`

---

## 📐 CLASIFICACIÓN DE SECRETOS

| Nivel | Ejemplos | Impacto si se expone | Rotación |
|-------|----------|---------------------|----------|
| 🔴 CRÍTICO | Claves privadas SSH, tokens de producción, DB passwords prod | Pérdida de control del sistema | Inmediata |
| 🟡 ALTO | API keys de servicios externos (OpenAI, Telegram, etc.) | Coste económico, acceso no autorizado | < 24h |
| 🔵 MEDIO | API keys de entornos de desarrollo | Acceso limitado a entornos no críticos | < 7 días |
| ⚪ BAJO | Tokens de dev locales, API keys de servicios gratuitos | Impacto mínimo | Mensual |

---

## 🔄 ESCALADO

| Nivel | Forma | Estado |
|-------|-------|--------|
| 0 — Manual | Este archivo | ✅ vigente |
| 1 — Script | `scripts/scan-secretos.sh` | 🔲 pendiente |
| 2 — GitHub Action | Pre-commit hook + Action en PR | 🔲 pendiente |
| 3 — Bot THDORA | Alerta automática si detecta patrón de secreto en push | 🔲 pendiente |

---

_Actualizado: 2026-07-14 · v2.0_
