# Ollama — IA Local
*Última actualización: 15 junio 2026*

## Estado

🔴 **POR INSTALAR.** En el equipo de la madre (cuando vayamos) y en el servidor Hetzner.

## ¿Por qué Ollama para THDORA?

1. **Privacidad total:** datos emocionales de usuarios que nunca salen del servidor
2. **Sin límites de tokens/mensajes** — inferencia local ilimitada
3. **Coste cero** en desarrollo y pruebas
4. **Fallback:** si las APIs de nube fallan, Ollama sigue
5. **Fine-tuning futuro:** modelo propio de THDORA entrenado en bienestar en español

## Modelos prioritarios

| Modelo | Tamaño | Uso en THDORA | Prioridad |
|--------|--------|---------------|-----------|
| Mistral 7B | ~4GB | Respuestas rápidas, bajo consumo | Alta |
| Nomic Embed | ~300MB | Embeddings para memoria de Toki | Alta |
| LLaVA | ~4GB | OCR e imágenes (fotos de notas) | Media |
| Llama 3.3 70B | ~40GB | Conversación avanzada (si hay GPU) | Baja/futura |

## Instalación rápida

```bash
# Instalar
curl -fsSL https://ollama.ai/install.sh | sh

# Modelo base
ollama pull mistral:7b

# Embeddings para Toki
ollama pull nomic-embed-text

# Probar
ollama run mistral:7b
```

## Checklist

- [ ] Instalar Ollama en el equipo de la madre
- [ ] Instalar Mistral 7B
- [ ] Instalar Nomic Embed
- [ ] Probar integración con LangChain
- [ ] Replicar en servidor Hetzner cuando esté listo
