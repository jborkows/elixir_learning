#!/bin/bash

# Create Elixir script scaffolding and update Makefile
# Usage: ./create-elixir-script.sh <script-name>

# Color codes for output
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Validate argument
if [[ $# -eq 0 ]]; then
    echo -e "${RED}Error: Script name argument required${NC}"
    echo "Usage: $0 <script-name>"
    echo "Example: $0 myfeature"
    exit 1
fi

SCRIPT_NAME="$1"
SCRIPT_PATH="helloworld/${SCRIPT_NAME}.exs"
MAKEFILE="Makefile"

# Check if script already exists
if [[ -f "$SCRIPT_PATH" ]]; then
    echo -e "${YELLOW}Warning: $SCRIPT_PATH already exists${NC}"
fi

# Create the Elixir script with EOF heredoc
cat > "$SCRIPT_PATH" << 'EOF'
IO.puts("Hello")
EOF

echo -e "${GREEN}✓ Created $SCRIPT_PATH${NC}"

# Update Makefile - add to .PHONY line
sed -i "s/^\(\.PHONY: .*\)$/\1, $SCRIPT_NAME/" "$MAKEFILE"

# Append new target to Makefile using EOF
cat >> "$MAKEFILE" << EOF
$SCRIPT_NAME:
	@(cd helloworld; elixir ${SCRIPT_NAME}.exs)
EOF

echo -e "${GREEN}✓ Updated $MAKEFILE${NC}"
echo ""
echo -e "${GREEN}Success!${NC} You can now run:"
echo -e "  ${GREEN}make $SCRIPT_NAME${NC}"
