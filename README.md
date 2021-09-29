# My Neovim config

## Dependencies

### Plugin Manager

* [packer.nvim](https://github.com/wbthomason/packer.nvim)

    ```bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

### Lsp Servers

* C/C++: [clangd](https://clangd.llvm.org/)

    ```bash
    pacman -S clang
    ```

* Python: [pyright](https://github.com/microsoft/pyright)

    ```bash
    npm install -g pyright
    ```

* Lua: [sumneko_lua](https://github.com/sumneko/lua-language-server)

    ```bash
    # clone project
    [ -d ~/.local/share/nvim/lspinstall ]\
        || mkdir ~/.local/share/nvim/lspinstall
    git clone https://github.com/sumneko/lua-language-server\
        ~/.local/share/nvim/lspinstall
    cd ~/.local/share/nvim/lspinstall/lua-language-server
    git submodule update --init --recursive

    # build project
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
    ```

* Bash: [bashls](https://github.com/bash-lsp/bash-language-server)

    ```bash
    npm install -g bash-language-server
    ```

* Docker: [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs)

    ```bash
    npm install -g dockerfile-language-server-nodejs
    ```

* Javascript/Typescript: [tsserver](https://github.com/typescript-language-server/typescript-language-server)

    ```bash
    npm install -g typescript typescript-language-server
    ```

* HTML/CSS: [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)

    ```bash
    npm install -g vscode-langservers-extracted
    ```

* Vue: [vetur](https://github.com/vuejs/vetur)

    ```bash
    npm install -g vls
    ```

### Formatters

* Python: [black](https://github.com/psf/black)

    ```bash
    pip install black
    ```

* C/C++: [clang-format](https://clang.llvm.org/docs/ClangFormat.html)

    ```bash
    pacman -S clang
    ```

* Lua: [LuaFormatter](https://github.com/Koihik/LuaFormatter)

    ```bash
    pacman -S luarocks
    luarocks install --server=https://luarocks.org/dev luaformatter
    ```

* Javascript/Typescript/HTML/CSS/Vue: [prettier](https://prettier.io/)

    ```bash
    npm install -g prettier
    ```

### Other

* Markdown to pdf: [pandoc](https://pandoc.org/)

    ```bash
    pacman -S pandoc
    ```

* Pdf viewer: [zathura](https://pwmt.org/projects/zathura/)

    ```bash
    pacman -S zathura zathura-mupdf
    ```

* Some patched font: [NerdFont](https://www.nerdfonts.com/)
