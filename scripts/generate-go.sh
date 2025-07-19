# =============================================================================
# SCRIPT GÉNÉRATION GO
# =============================================================================

#!/bin/bash

set -e

PROTO_DIR="./proto"
GO_OUT_DIR="./gen/go"
MODULE_NAME="github.com/lhommenul/protobuf/gen/go/marketplace"

echo "🚀 Génération des clients Go..."

# Créer le répertoire de sortie
mkdir -p ${GO_OUT_DIR}

# Générer les fichiers Go
protoc \
  --proto_path=${PROTO_DIR} \
  --go_out=${GO_OUT_DIR} \
  --go_opt=module=${MODULE_NAME} \
  --go-grpc_out=${GO_OUT_DIR} \
  --go-grpc_opt=module=${MODULE_NAME} \
  ${PROTO_DIR}/*.proto

# Initialiser le module Go si nécessaire
if [ ! -f "${GO_OUT_DIR}/go.mod" ]; then
  cd ${GO_OUT_DIR}
  go mod init ${MODULE_NAME}
  go mod tidy
  cd -
fi
