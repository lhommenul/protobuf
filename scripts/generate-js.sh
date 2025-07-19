# =============================================================================
# SCRIPT GÉNÉRATION JAVASCRIPT/TYPESCRIPT
# =============================================================================

#!/bin/bash
# scripts/generate-js.sh

set -e

PROTO_DIR="./proto"
JS_OUT_DIR="./gen/js"

echo "🚀 Génération des clients JavaScript..."

# Créer les répertoires de sortie
mkdir -p ${JS_OUT_DIR}

# Générer JavaScript
protoc \
  --proto_path=${PROTO_DIR} \
  --js_out=import_style=commonjs,binary:${JS_OUT_DIR} \
  ${PROTO_DIR}/*.proto

echo "✅ Génération JavaScript terminée dans ${JS_OUT_DIR}"

# Créer package.json pour les clients générés
cat >${JS_OUT_DIR}/package.json <<EOF
{
  "name": "marketplace-proto-js",
  "version": "1.0.0",
  "description": "Marketplace Protocol Buffers - JavaScript Client",
  "main": "index.js",
  "dependencies": {
    "google-protobuf": "^3.21.2"
  }
}
EOF
