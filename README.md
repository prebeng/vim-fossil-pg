# Fossil plugin for vim

A [Vim][vim] plugin for working with the [Fossil][fossil] distributed software
configuration management system.

The plugin provides vim commands that execute `fossil` commands and capture
the output.  The following commands are available by default:

- `:Fossil[!]` splits the window and captures the `fossil` output.
  By default, the window is split horizontally, but this us configurable.
  If run as `:Fossil!`, the output is not captured.
- `:SFossil` (Split fossil) always splits horizontally.
- `:VFossil` (Vertical fossil) always splits vertically.
- `:CFossil` (Capture Fossil) merely switches to the temporary buffer.
- `:RFossil` reads in the output in the current buffer.

All commands have tab completion based on `fossil help -a -v`.

Syntax highlighting is provided that works with `fossil commit`, `status`,
`timeline`, `help` and to some extent with other commands.

Please see `:help fossil` in vim for more information.

The plugin is inspired by the [vim-fossil plugin][inspiration] by J Knight.

## Installation

Using vim plugin managaers, use the [github mirror][github] with e.g.

```
    :Plug 'prebeng/vim-fossil-pg'
```

Using fossil:

1. Create directory `~/.vim/pack/simple/start/vim-fossil-pg/`, where `simple`
   can be any directory name (I use this for simple plugins).
2. Clone [the officieal repository][repourl] in a location of your liking.
3. In the directory in step 1, use `fossil open` to check out the reposository.
3. Run `:helptags ~/.vim/pack/simple/start/vim-fossil-pg/doc`.

Manual installation:

- Optionally use a directory as with step 1 for fossil, otherwise use `~/.vim`.
- Copy the [doc, plugin and syntax folders](/dir?ci=tip) to the directory.

[fossil]: https://fossil-scm.org/
[github]: https://github.com/prebeng/vim-fossil-pg.git
[inspiration]: https://github.com/mtvee/vim-fossil
[repourl]: https://fossil.guldberg.org/vim-fossil-pg/
[vim]: https://vim.org/
