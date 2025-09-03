# Jazzy's NeoVim Configs

:warning:I've been in the process of fully migrating to lua for my configs. This config is very much a WIP now:warning:

### My Key Mappings

|      Keys      |        What they do         |
| :------------: | :-------------------------: |
|   `spacebar`   |      Mapped to leader       |
|   `leader+H`   |       Previous Buffer       |
|   `leader+L`   |         Next Buffer         |
| `leader+<1-9>` |     Switch to buffer #      |
|   `leader+Enter`   |         line break         |
|   `leader+;`   |         add semicolon to EOL         |
|   `leader+,`   |         add comma to EOL         |
|   `leader+}`   |         add closing curly bracket after cursor         |
|   `leader+]`   |         add closing square bracket after cursor         |
|   `leader+)`   |         add closing parren after cursor         |
|   `leader+"`   |         add double quote after cursor         |
|   `leader+'`   |         add single quote after cursor         |
|   `leader+rc`   |        surround visual selection in a _react comment_ (i.e. {/* your comment here */})         |
|   `leader+/`   |        surround visual selection in an inline js comment /* */         |
|    `Ctrl+H`    |     Switch to left tile     |
|    `Ctrl+L`    |    Switch to right tile     |
|    `Ctrl+J`    |    Switch to bottom tile    |
|    `Ctrl+K`    |     Switch to top tile      |
|     `<F1>`     |      Toggle neo tree files       |
|     `<F2>`     |      Toggle neo tree buffers       |
|     `<F3>`     |      Toggle neo tree git       |
|     `leader+w`     |  Wipe search highlighting  |
|    `Ctrl+P`    | Fuzzy Search |
|    `Ctrl+G`    | Grep Search |
|   `Shift+H`    |      Beginning of line      |
|   `Shift+L`    |         End of line         |
|   `Shift+J`    |        Down 4 lines         |
|   `Shift+K`    |         Up 4 lines          |
|   `jk`    |         exit insert mode          |
|   `Ctrl+U`    |         capitalize word          |

### Usage

1.  clone to user home
2.  cd into this repo
3.  run `./link.sh`
4.  enjoy!

#### Vim Usage
1. checkout the `vim` branch
1. run `./init.sh`
