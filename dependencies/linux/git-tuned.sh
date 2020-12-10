#!/usr/bin/env bash
# needs: git aliases gh hub

ALIASES_FILE="$HOME/bin/aliases/git.sh"

echo "alias git=hub"       > $ALIASES_FILE
echo ""                    >>$ALIASES_FILE
echo "alias add='git add'" >>$ALIASES_FILE
echo "alias st='git status'" >>$ALIASES_FILE
