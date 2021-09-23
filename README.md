# My Neovim config

## Dependencies

### Plugin Manager

* [packer.nvim](https://github.com/wbthomason/packer.nvim)
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Lsp

* C/C++: [clangd](https://clangd.llvm.org/)
    ```bash
    sudo pacman -S cland
    ```
* Python: [pyright](https://github.com/microsoft/pyright)
    ```bash
    npm install -g pyright
    ```
* Lua: [sumneko_lua](https://github.com/sumneko/lua-language-server)
    ```bash
    # clone project
    git clone https://github.com/sumneko/lua-language-server <nvim_data>
    cd lua-language-server
    git submodule update --init --recursive

    # build project
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
    ```
* Bash: [bashls](https://github.com/bash-lsp/bash-language-server)
    ```bash
    npm i -g bash-language-server
    ```

### Other

* Markdown to pdf: [pandoc](https://pandoc.org/)
    ```bash
    sudo pacman -S pandoc
    ```
* Some patched font: [(NerdFont)](https://www.nerdfonts.com/)
