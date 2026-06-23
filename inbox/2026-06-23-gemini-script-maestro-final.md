---
tags: [inbox, batcueva, docker, gemini, rag, qdrant, osint, script, fase2]
fecha: 2026-06-23
estado: REVISAR-ANTES-DE-EJECUTAR
fuente: Gemini
validado-por: Perplexity
---

# 🤖 Gemini — Script Maestro Final Batcueva (RAG + Qdrant)

> Script definitivo con motor RAG vectorial integrado.
> **⚠️ NO ejecutar de golpe — hacerlo por fases.**

---

## 💡 Novedad clave respecto a scripts anteriores

**Qdrant** — base de datos vectorial escrita en Rust, <300MB RAM.
Permite búsqueda semántica de escaneos históricos: cuando IVRE detecta un servicio,
el motor RAG busca en Qdrant si hay patrones similares del pasado y los incluye
automáticamente en el análisis de Ollama. **Memoria OSINT a largo plazo.**

---

## ⚠️ Notas de revisión (Perplexity)

| Item | Estado | Nota |
|---|---|---|
| `mountainsec/recon-ng:latest` | ❓ Verificar | Imagen no oficial |
| `caffix/amass:latest` | ❓ Verificar | Verificar nombre correcto |
| `ivre/web:latest` + `ivre/client:latest` | ❓ Verificar | Confirmar en Docker Hub |
| Ollama ya lanzado en terminal 3 | ⚠️ Duplicado | No relanzar, ya corre en :11434 |
| `vm.max_map_count=262144` | ✅ Necesario | Para MongoDB + Qdrant |
| Puerto 6333 (Qdrant) | ✅ Libre | Sin conflicto |
| Puerto 8089 (IVRE) | ✅ Libre | Sin conflicto |
| `qdrant/qdrant:latest` | ✅ Imagen oficial | Existe en Docker Hub |
| `mongo:6.0` | ✅ Imagen oficial | Existe en Docker Hub |
| Amass con `profiles: tools` | ✅ Correcto | Solo corre bajo demanda |

---

## 🚀 docker-compose.yml — Solo servicios nuevos

> Ollama ya se está descargando en terminal 3 — no incluirlo aquí para evitar conflicto.

```yaml
version: '3.8'

services:
  # tar1090 (aviones ADS-B)
  osiris-globe:
    image: ghcr.io/sdr-enthusiasts/docker-tar1090:latest
    container_name: osiris-globe
    restart: unless-stopped
    ports:
      - "8085:80"
    environment:
      - TZ=Europe/Madrid
      - LAT=40.4167
      - LON=-3.7037
      - NAME=Batcueva_Station
    volumes:
      - osiris_globe_data:/var/globe_history

  # Kismet WiFi audit
  kismet:
    image: kismet/kismet:latest
    container_name: kismet-server
    restart: unless-stopped
    network_mode: "host"
    privileged: true
    cap_add:
      - NET_ADMIN
    environment:
      - TZ=Europe/Madrid
    volumes:
      - kismet_data:/rxtx
      - /dev/bus/usb:/dev/bus/usb

  # IVRE MongoDB
  ivre-db:
    image: mongo:6.0
    container_name: ivre-mongodb
    restart: unless-stopped
    environment:
      - TZ=Europe/Madrid
    volumes:
      - ivre_db_data:/data/db

  # IVRE Web UI
  ivre-web:
    image: ivre/web:latest
    container_name: ivre-webui
    restart: unless-stopped
    ports:
      - "8089:80"
    environment:
      - TZ=Europe/Madrid
    depends_on:
      - ivre-db

  # IVRE CLI
  ivre-client:
    image: ivre/client:latest
    container_name: ivre-cli
    restart: unless-stopped
    network_mode: "host"
    environment:
      - TZ=Europe/Madrid
    volumes:
      - ./ivre/scans:/workspace
    depends_on:
      - ivre-db

  # Recon-ng
  recon-ng:
    image: mountainsec/recon-ng:latest
    container_name: batcueva-reconng
    restart: unless-stopped
    stdin_open: true
    tty: true
    environment:
      - TZ=Europe/Madrid
    volumes:
      - recon_ng_data:/root/.recon-ng

  # Qdrant - Base de datos vectorial RAG
  qdrant:
    image: qdrant/qdrant:latest
    container_name: batcueva-qdrant
    restart: unless-stopped
    ports:
      - "6333:6333"
    environment:
      - TZ=Europe/Madrid
    volumes:
      - qdrant_data:/qdrant/storage

  # Amass - solo bajo demanda
  amass:
    image: caffix/amass:latest
    container_name: batcueva-amass
    profiles:
      - tools
    environment:
      - TZ=Europe/Madrid
    volumes:
      - ./amass:/config
      - ./ivre/scans:/outputs

volumes:
  osiris_globe_data:
  kismet_data:
  ivre_db_data:
  recon_ng_data:
  qdrant_data:
```

---

## 🐍 rag_osint_engine.py

```python
import os
import json
import requests
from datetime import datetime
from pymongo import MongoClient
from qdrant_client import QdrantClient
from qdrant_client.models import Distance, VectorParams, PointStruct

IP_MADRE = "100.91.112.32"
OLLAMA_EMBED_URL = f"http://{IP_MADRE}:11434/api/embeddings"
OLLAMA_GENERATE_URL = f"http://{IP_MADRE}:11434/api/generate"
OBSIDIAN_INBOX = "/home/alvaro/yggdrasil-dew/inbox"
COLLECTION_NAME = "batcueva_osint_vectors"

mongo_client = MongoClient('mongodb://127.0.0.1:27017/')
db_ivre = mongo_client.ivre
qdrant_client = QdrantClient(host="127.0.0.1", port=6333)

try:
    qdrant_client.create_collection(
        collection_name=COLLECTION_NAME,
        vectors_config=VectorParams(size=768, distance=Distance.COSINE),
    )
except Exception:
    pass

def obtener_embedding(texto):
    try:
        response = requests.post(OLLAMA_EMBED_URL, json={
            "model": "nomic-embed-text",
            "prompt": texto
        }, timeout=10)
        return response.json().get("embedding")
    except Exception as e:
        print(f"[-] Error embedding: {e}")
        return None

def buscar_contexto_historico(vector):
    try:
        resultados = qdrant_client.search(
            collection_name=COLLECTION_NAME,
            query_vector=vector,
            limit=2
        )
        return "\n".join([f"- Histórico ({r.payload.get('addr')}): {r.payload.get('banner')}" for r in resultados])
    except Exception:
        return ""

def main():
    print("[*] Leyendo datos IVRE MongoDB...")
    try:
        scans = db_ivre.results.find({"service": {"$exists": True}}).limit(5)
    except Exception as e:
        print(f"[-] Error MongoDB: {e}")
        return

    for scan in scans:
        ip = scan.get("addr", "IP_Desconocida")
        servicio = scan.get("service", "Unknown")
        banner = scan.get("banner", "No Banner")
        texto = f"IP: {ip} | Servicio: {servicio} | Banner: {banner}"

        vector = obtener_embedding(texto)
        if not vector:
            continue

        contexto = buscar_contexto_historico(vector)

        prompt = f"""Analista de ciberinteligencia. Objetivo: {texto}.
        Historial correlacionado: {contexto or 'Primer avistamiento.'}
        Identifica vulnerabilidades y CVEs relevantes de forma concisa."""

        try:
            res = requests.post(OLLAMA_GENERATE_URL, json={
                "model": "llama3:latest", "prompt": prompt, "stream": False
            }, timeout=90)
            analisis = res.json().get("response")
        except Exception as e:
            analisis = f"Error Ollama: {e}"

        qdrant_client.upsert(
            collection_name=COLLECTION_NAME,
            points=[PointStruct(
                id=hash(ip) & 0xFFFFFFFFFFFFFFFF,
                vector=vector,
                payload={"addr": ip, "service": servicio, "banner": banner,
                         "timestamp": datetime.now().isoformat()}
            )]
        )

        filename = f"OSINT_RAG_{ip}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.md"
        with open(os.path.join(OBSIDIAN_INBOX, filename), "w") as f:
            f.write(f"""---
tags: [osint-intelligence, rag-core, batcueva]
target: {ip}
date: {datetime.now().strftime('%Y-%m-%d')}
---

# Reporte RAG — {ip}

## Firma Técnica
- **IP:** {ip} | **Servicio:** {servicio} | **Banner:** `{banner}`

## Historial Correlacionado (Qdrant)
{contexto or '_Primer avistamiento._'}

## Análisis IA (Ollama)
{analisis}
""")
        print(f"[+] Nota generada para {ip}")

if __name__ == "__main__":
    main()
```

---

## 📌 Caddyfile maestro completo

```
osiris.madre.tailscale    { reverse_proxy 127.0.0.1:8085 }
kismet.madre.tailscale    { reverse_proxy 127.0.0.1:2501 }
ollama.madre.tailscale    { reverse_proxy 127.0.0.1:11434 }
thdora.madre.tailscale    { reverse_proxy 127.0.0.1:8000 }
grafana.madre.tailscale   { reverse_proxy 127.0.0.1:3000 }
prometheus.madre.tailscale{ reverse_proxy 127.0.0.1:9090 }
portainer.madre.tailscale { reverse_proxy 127.0.0.1:9000 }
uptime.madre.tailscale    { reverse_proxy 127.0.0.1:3002 }
openwebui.madre.tailscale { reverse_proxy 127.0.0.1:3001 }
spiderfoot.madre.tailscale{ reverse_proxy 127.0.0.1:5001 }
ivre.madre.tailscale      { reverse_proxy 127.0.0.1:8089 }
qdrant.madre.tailscale    { reverse_proxy 127.0.0.1:6333 }
```

---

## ✅ Orden de ejecución correcto

```bash
# 1. Parche kernel (una vez)
sudo sysctl -w vm.max_map_count=262144
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.d/99-batcueva.conf

# 2. Verificar imágenes antes de levantar
docker pull ivre/web:latest
docker pull ivre/client:latest
docker pull kismet/kismet:latest
docker pull mountainsec/recon-ng:latest  # si falla: buscar alternativa

# 3. Levantar
cd /home/alvaro/docker/batcueva-fase2
docker compose up -d

# 4. Después de que Ollama esté up, descargar modelos
docker exec batcueva-ollama ollama pull llama3:latest
docker exec batcueva-ollama ollama pull nomic-embed-text:latest

# 5. Instalar deps Python del orquestador RAG
pip install pymongo requests qdrant-client

# 6. Instalar y configurar Caddy
sudo pacman -S --noconfirm caddy
# Copiar Caddyfile maestro de arriba a /etc/caddy/Caddyfile
sudo systemctl enable --now caddy
```

---

_Fuente: Gemini (23/06/2026) · Corregido y estructurado por Perplexity · MCP GitHub_
