# LazyVim

## 🛠️ Installation

**Make a backup of your current Neovim files:**

## Window

- Make a backup of your current Neovim files:

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

```

- Clone the starter

```bash
git clone https://github.com/LazyVim/starter $env:LOCALAPPDATA\nvim
```

- Remove the .git folder, so you can add it to your own repo later

```bash
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force
```

- Start Neovim!

```bash
nvim
```

[Installation LazyVim](https://www.lazyvim.org/installation)

**Refer to the comments in the files on how to customize LazyVim.**
