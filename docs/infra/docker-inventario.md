NAMES                STATUS                            IMAGE
open-webui           Up 3 hours (healthy)              ghcr.io/open-webui/open-webui:main
ollama               Up 3 hours                        ollama/ollama:latest
qdrant               Up 3 hours (unhealthy)            qdrant/qdrant:latest
ollama-embeddings    Up 3 hours (healthy)              ollama/ollama:latest
thdora-bot           Up 5 seconds (health: starting)   thdora-bot
local_tripwire       Up 8 seconds (health: starting)   yggdrasil-secops-local_tripwire
radar_backup         Up 3 hours                        alpine:latest
guardian_bot         Up 3 hours (healthy)              yggdrasil-secops-guardian_bot
yggdrasil_watchdog   Up 3 hours (healthy)              yggdrasil-secops-yggdrasil_watchdog
network_radar        Up 3 hours (healthy)              yggdrasil-secops-network_radar
log_guardian_bot     Up 3 hours (healthy)              yggdrasil-secops-log_guardian
tailscale_monitor    Up 3 hours (healthy)              yggdrasil-secops-tailscale_monitor
grafana              Exited (0) 29 hours ago           grafana/grafana:10.4.2
prometheus           Exited (0) 29 hours ago           prom/prometheus:v2.51.2
thdora               Exited (0) 29 hours ago           thdora-thdora
kali-pentest         Exited (0) 29 hours ago           kasmweb/kali-rolling-desktop:1.16.0
spiderfoot           Exited (137) 29 hours ago         spiderfoot
code-server          Up 3 hours                        lscr.io/linuxserver/code-server:latest
n8n                  Up 3 hours                        n8nio/n8n:latest
gitea                Up 3 hours                        gitea/gitea:latest
uptime-kuma          Up 3 hours (healthy)              louislam/uptime-kuma:1
portainer            Up 3 hours                        portainer/portainer-ce:latest
DRIVER    VOLUME NAME
local     local_tripwire_tripwire_data
local     network_radar_radar_backups
local     network_radar_radar_data
local     ollama
local     open-webui
local     osint-stack_kali_data
local     portainer_data
local     qdrant_data
local     servidor_code_server_config
local     servidor_gitea_data
local     servidor_headscale_config
local     servidor_headscale_data
local     servidor_n8n_data
local     spiderfoot_spiderfoot-data
local     thdora_grafana_data
local     thdora_prometheus_data
local     thdora_thdora_data
local     uptime-kuma
local     varopc_ollama_data
local     varopc_ollama_embeddings_data
local     varopc_open_webui_data
local     varopc_qdrant_data
local     varopc_qdrant_storage
local     yggdrasil-secops_radar_backups
local     yggdrasil-secops_radar_data
local     yggdrasil-secops_tripwire_data
local     yggdrasil-secops_ts_data
NETWORK ID     NAME                       DRIVER    SCOPE
9a4000a8e249   batcueva                   bridge    local
2cfe0d91f3c7   bridge                     bridge    local
05da993149b7   host                       host      local
e82a9e852d99   mcp-server_default         bridge    local
d2b10e3ba4fa   none                       null      local
7402fdddba69   osint-stack_default        bridge    local
081cc1e704c6   spiderfoot_default         bridge    local
94b8fe86d3bf   thdora_thdora-net          bridge    local
f2638e8e8584   varopc_default             bridge    local
bc98527e89ff   yggdrasil-secops_default   bridge    local
REPOSITORY                            TAG           IMAGE ID       SIZE
ghcr.io/github/github-mcp-server      latest        c491ffdf6f4c   66.2MB
yggdrasil-secops-guardian_bot         latest        147851ae55ff   314MB
yggdrasil-secops-log_guardian         latest        4385e6beef17   224MB
yggdrasil-secops-tailscale_monitor    latest        8aa5002c0e79   211MB
yggdrasil-secops-yggdrasil_watchdog   latest        0c9d91ca7b35   214MB
mcp-server-mcp-server                 latest        57dc92beff13   566MB
yggdrasil-secops-network_radar        latest        41ca2822da39   209MB
yggdrasil-secops-local_tripwire       latest        4dd01c91cb63   205MB
network_radar-network-radar           latest        d33ee2a53cb3   209MB
local_tripwire-local_tripwire         latest        de52f24c4ee6   205MB
guardian_bot-guardian_bot             latest        1af5f58e6f2d   315MB
log_guardian-log-guardian             latest        1f16f98bb44f   223MB
spiderfoot                            latest        2fea15fdb3c5   286MB
jasonish/suricata                     latest        c4316e969480   646MB
searxng/searxng                       latest        c6d6af406d21   376MB
netdata/netdata                       latest        2330e67d4543   1.15GB
ghcr.io/berriai/litellm               main-latest   f792e404f0db   1.53GB
traefik                               latest        e4d98158c01a   245MB
gitea/gitea                           latest        8e25c717b8f7   247MB
thdora-thdora                         latest        4dfe64f19f2c   531MB
thdora-bot                            latest        594bf3d3c62f   531MB
aquasec/trivy                         latest        f5d0e600ecda   255MB
n8nio/n8n                             latest        a772d24e6b4f   2.39GB
headscale/headscale                   latest        8453e47ea6bf   113MB
lscr.io/linuxserver/code-server       latest        7e9523734c00   1.08GB
ollama/ollama                         latest        bfc9c6d53cc6   8.29GB
hashicorp/vault                       latest        a296a888b118   740MB
prom/prometheus                       latest        a75c5a35bc21   427MB
postgres                              15-alpine     cd17e2ac9824   417MB
alpine                                latest        28bd5fe8b56d   14MB
thdora                                latest        f847b374f93e   282MB
pihole/pihole                         latest        8ea95136e7c8   150MB
nicolargo/glances                     latest        5bc5b6cf2e7b   185MB
linuxserver/heimdall                  latest        d701a4619786   295MB
prom/alertmanager                     latest        af26fbe4dd18   121MB
linuxserver/wireguard                 latest        1bf21d1c8933   169MB
portainer/portainer-ce                latest        d27f76194b71   242MB
qdrant/qdrant                         latest        75eab8c4ba42   269MB
jc21/nginx-proxy-manager              latest        52b2c59994f3   1.77GB
grafana/grafana                       latest        5dad0df181cb   1.46GB
ghcr.io/open-webui/open-webui         main          7f1b0a1a50cf   6.7GB
crazymax/fail2ban                     latest        7cd8a427a446   121MB
crowdsecurity/crowdsec                latest        2f527c9bb8b3   497MB
redis                                 7-alpine      6ab0b6e73817   58.9MB
vaultwarden/server                    latest        d626d04934cd   347MB
ghcr.io/paperless-ngx/paperless-ngx   latest        6c86cad80397   2.01GB
ghcr.io/ajnart/homarr                 latest        e103abadfb52   1.5GB
louislam/uptime-kuma                  1             3d632903e6af   707MB
louislam/uptime-kuma                  latest        3d632903e6af   707MB
kasmweb/kali-rolling-desktop          1.16.0        fb1a37a4f2b8   13.8GB
grafana/grafana                       10.4.2        7d5faae481a4   574MB
prom/prometheus                       v2.51.2       4f6c47e39a90   370MB
wazuh/wazuh-dashboard                 4.7.0         3fce7c14791f   1.56GB
wazuh/wazuh-manager                   4.7.0         9812b300f8e1   1.2GB
containrrr/watchtower                 latest        6dd50763bbd6   22.2MB
