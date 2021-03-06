# My Neovim config

## Installation

1. Clone config

    ```bash
    git clone https://github.com/TimotheeDesveaux/nvim-config.git\
        ~/.config/nvim
    ```

2. Install [packer.nvim](https://github.com/wbthomason/packer.nvim):

    ```bash
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    ```

3. Install plugins:

    ```bash
    nvim +PackerSync
    ```

## Dependencies

### Plugin Manager

* [packer.nvim](https://github.com/wbthomason/packer.nvim)

### Lsp Servers

* Bash: [bashls](https://github.com/bash-lsp/bash-language-server)
* C/C++: [clangd](https://clangd.llvm.org/)
* Cmake: [cmake-language-server](https://github.com/regen100/cmake-language-server)
* Docker: [dockerls](https://github.com/rcjsuen/dockerfile-language-server-nodejs)
* Emmet: [emmet-ls](https://github.com/aca/emmet-ls)
* HTML/CSS: [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)
* Javascript/Typescript: [tsserver](https://github.com/typescript-language-server/typescript-language-server)
* Lua: [sumneko_lua](https://github.com/sumneko/lua-language-server)
* Python: [pyright](https://github.com/microsoft/pyright)
* Rust: [rust-analyser](https://github.com/rust-analyzer/rust-analyzer)
* Tailwindcss: [tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense)
* Vue: [vetur](https://github.com/vuejs/vetur)

### Formatters

* C/C++: [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
* Cmake: [cmake-format](https://github.com/regen100/cmake-language-server)
* Javascript/Typescript/HTML/CSS/SCSS/Vue/JSON/YAML: [prettier](https://prettier.io/)
* Lua: [LuaFormatter](https://github.com/Koihik/LuaFormatter)
* Python: [black](https://github.com/psf/black)
* Rust: [rustfmt](https://github.com/rust-lang/rustfmt)

### Other

* Markdown to pdf: [pandoc](https://pandoc.org/)
* Pdf viewer: [zathura](https://pwmt.org/projects/zathura/)
* Some patched font: [NerdFont](https://www.nerdfonts.com/)
