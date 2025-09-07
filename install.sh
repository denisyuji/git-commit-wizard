#!/bin/bash

echo "[INFO] Installing git-commit-wizard..."
rm -rf /usr/local/bin/git-commit-wizard/local/bin
mkdir -p ~/.local/bin
cp ./git-commit-wizard.sh ~/.local/bin/git-commit-wizard
sudo chmod +x ~/.local/bin/git-commit-wizard

# === Ensure ~/.local/bin is in PATH ===
if ! echo ":$PATH:" | grep -q ":$HOME/.local/bin:"; then
  SHELL_NAME="$(basename "$SHELL")"
  case "$SHELL_NAME" in
    bash)
      SHELL_RC="$HOME/.bashrc"
      ;;
    zsh)
      SHELL_RC="$HOME/.zshrc"
      ;;
    fish)
      SHELL_RC="$HOME/.config/fish/config.fish"
      ;;
    *)
      SHELL_RC="$HOME/.profile"
      ;;
  esac

  echo "[INFO] Adding ~/.local/bin to PATH in $SHELL_RC"
  {
    echo ""
    echo "# Added by AppImage installer on $(date)"
    if [[ "$SHELL_NAME" == "fish" ]]; then
      echo "set -U fish_user_paths \$HOME/.local/bin \$fish_user_paths"
    else
      echo 'export PATH="$HOME/.local/bin:$PATH"'
    fi
  } >> "$SHELL_RC"

  echo "[INFO] ~/.local/bin added to PATH. Restart your shell or run:"
  if [[ "$SHELL_NAME" == "fish" ]]; then
    echo "       set -U fish_user_paths \$HOME/.local/bin \$fish_user_paths"
  else
    echo "       export PATH=\"\$HOME/.local/bin:\$PATH\""
  fi
else
  echo "[INFO] ~/.local/bin already in PATH"
fi

echo "[INFO] git-commit-wizard installed successfully!"
echo "[INFO] You can now use git-commit-wizard by running 'git-commit-wizard' in your terminal."