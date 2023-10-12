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

Copy the files in the [doc, plugin and syntax folders](/tree?ci=trunk&type=tree)
to the same folders in your `~/.vim` folder.

Make sure to run `:helptags ~/.vim/doc` for `:help fossil` to work.

[vim]: https://vim.org
[fossil]: https://fossil-scm.org/
[inspiration]: [https://github.com/mtvee/vim-fossil]
