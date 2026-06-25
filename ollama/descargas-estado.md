# Estado de Descargas Ollama — 2026-06-25

**Última actualización:** 2026-06-25 13:50 CEST  
**Verificado con:** `ollama list` (pendiente verificar en persona)

---

## Modelos confirmados en disco

| Modelo | Tamaño aprox | Estado | Fecha |
|--------|-------------|--------|-------|
| `qwen2.5:3b` | ~2 GB | ✅ Confirmado | 2026-06-24 noche |
| `qwen2.5:7b` | ~4.7 GB | ⏳ Descarga iniciada | 2026-06-24→25 |
| `nomic-embed-text` | ~274 MB | ⏳ En cola | 2026-06-24→25 |
| `bge-m3` | ~1.2 GB | ⏳ En cola | 2026-06-24→25 |

---

## Comportamiento KEEP_ALIVE confirmado

- `ollama ps` vacío = **normal**. El modelo se descarga de VRAM tras cada request si KEEP_ALIVE=0 (default).
- `ollama stop <modelo>` da error si el modelo ya no está en VRAM — **comportamiento esperado**, no es un fallo.
- Para mantener modelo cargado: `OLLAMA_KEEP_ALIVE=5m ollama run qwen2.5:3b`

---

## RAM disponible para modelos

- Total RAM: ~15 GB
- Disponible: ~9.5 GB
- Swap: 45 MB (prácticamente sin swap — configurado así a propósito)
- **Conclusión:** qwen2.5:7b cabe en RAM (~4.7 GB), los dos modelos de embedding también.

---

## Comandos útiles

```bash
# Ver modelos instalados
ollama list

# Ver modelo cargado en VRAM ahora mismo
ollama ps

# Descargar modelo
ollama pull qwen2.5:7b

# Test rápido
ollama run qwen2.5:3b "hola, funciona?"

# Ver tamaño en disco
du -sh ~/.ollama/models/
```

---

## Siguiente paso

Cuando se confirmen todas las descargas, actualizar `ESTADO-SISTEMA.md` con la tabla de modelos activos.

**Ver también:** `diarios/2026-06-25.md`
