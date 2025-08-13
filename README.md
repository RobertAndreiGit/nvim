## Clean Up Existing Config

# Linux / MacOS (unix)

rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Flatpak (linux)

rm -rf ~/.var/app/io.neovim.nvim/config/nvim
rm -rf ~/.var/app/io.neovim.nvim/data/nvim
rm -rf ~/.var/app/io.neovim.nvim/.local/state/nvim

# Windows CMD

rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Windows PowerShell

rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

## Install

git clone https://github.com/RobertAndreiGit/nvim ~/.config/nvim && nvim
