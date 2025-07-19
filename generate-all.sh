# =============================================================================
# SCRIPT TOUT-EN-UN
# =============================================================================

#!/bin/bash

set -e

echo "🏗️  Génération de tous les clients Protocol Buffers..."

# Générer Go
./scripts/generate-go.sh

# Générer JavaScript/TypeScript
./scripts/generate-js.sh

echo "🎉 Tous les clients ont été générés avec succès !"
echo ""
echo "📁 Structure générée :"
echo "  gen/"
echo "  ├── go/           # Clients Go"
echo "  ├── js/           # Clients JavaScript"
