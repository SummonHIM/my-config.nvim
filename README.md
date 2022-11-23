# my-config.nvim
SummonHIM Personal NVim config repo

## 使用方法
### Linux
```
apt install neovim clang python3 git && pip install neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/SummonHIM/my-config.nvim.git ~/.config/nvim
```
### Windows
```
winget install Neovim.neovim
winget install Git.git
winget install Python.Python.3
winget install msys2.msys2
pip install neovim
msys.exe
pacman -S base-devel mingw-w64-clang-x86_64-toolchain mingw-w64-clang-x86_64-cninja --needed
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
git clone https://github.com/SummonHIM/my-config.nvim.git %LOCALAPPDATA%\nvim
```
