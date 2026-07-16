---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-16
actualizado: 2026-07-16
ruta: protocolo/PROTOCOLO-SECRETOS.md
tags: [protocolo, seguridad, secretos, tokens, canon]
status: vigente
version: 1.0
---

# PROTOCOLO-SECRETOS v1.0

> Regla absoluta del ecosistema: ningun secreto en ningun .md.
> Un token en un repo publico es una brecha de seguridad inmediata.
> Tiempo estimado: 5 min (revision rapida) / 20 min (escaneo completo).

---

## Que es un secreto

```
SECRETO = cualquier dato que no debe ser publico:
  - Tokens de API (Telegram, GitHub, servicios)
  - Passwords y credenciales
  - IPs privadas de la red local o servidores
  - Puertos de servicios internos
  - Claves SSH o GPG
  - Rutas absolutas del sistema que revelan estructura interna
```

---

## Regla de oro

```
Si tienes duda de si algo es un secreto -> tratalo como secreto.
Nunca va en un .md. Nunca en un repo. Ni en draft, ni en borrador.
```

---

## Al crear un archivo nuevo

```
[ ] Revisar que no contiene ningun elemento de la lista de secretos
[ ] Si necesitas referenciar una IP -> usar placeholder: <IP-SERVIDOR>
[ ] Si necesitas referenciar un token -> usar placeholder: <TOKEN-SERVICIO>
[ ] Si necesitas referenciar una ruta -> usar ruta relativa, no absoluta
```

---

## Revision rapida (antes de commit)

```
[ ] Buscar en los archivos modificados: token, password, passwd, secret, key, ip
[ ] Buscar patrones numericos de IP: 192.168., 10.0., 172.16.
[ ] Buscar tokens largos: strings de >20 caracteres alfanumericos sin espacios
[ ] Si encuentras algo -> eliminarlo ANTES del commit
```

---

## Si un secreto llego a un commit publico

```
[ ] URGENTE: revocar/rotar el secreto en el servicio inmediatamente
[ ] No intentar reescribir la historia de git como primera accion (no funciona bien)
[ ] Crear issue privado en DEW documentando el incidente
[ ] Notificar si el servicio afectado requiere notificacion
[ ] Despues de rotar: evaluar si limpiar historial git con BFG o filter-branch
```

---

## Escaneo periodico (parte de AUDITORIA-ECOSISTEMA)

```
[ ] Revisar ultimos 30 commits de repos publicos (dew, wiki, formacion)
[ ] Buscar patrones de secretos en archivos nuevos del mes
[ ] Verificar que .gitignore incluye archivos de entorno (.env, .env.*)
```

---

## Relacionado

- PROTOCOLO-AUDITORIA-ECOSISTEMA.md (fase 4)
- issue #15 (Puerto 21 FTP abierto)
- issue #45 (Token Telegram pendiente)

---

_Creado: 2026-07-16 v1.0 F15 Perplexity MCP_
