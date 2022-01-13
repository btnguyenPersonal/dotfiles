# VIM
#### EX commands
 - use `%%` in ex mode
#### navigation
 - **please** use `f` more often
 - omg `/` commands are so op
 - use `\V` and `\C` in searches
 - use `it` `ib` and `iB` for everything omg
 - `ge` is pretty useful
 - make a *global mark* before going off to a bunch of dif files
 - also make a habit of making a `g` mark before `gg=G`
 - always try to use `*` or `/` or `<C-r><C-w>` to sub way easier
#### insert mode
 - use the capslock as ctrl feature in insert mode
 - stop using backspace, use `<C-e>` `<C-w>` `<C-h>`
## @@@@ M@CROS @@@@
 - normalize cursor position
 - use word-wise functions instead of `hjkl`
 - also use searches when necessary
 - `9999@w` will close on error
 - `:norm @w` will run on every line and not quit
 - `qW` will append to the macro
   - test out macro recursion
   - have a "macro week" after mastering every other habit here
#### args
 - args will let us run macros on many files
 - also open many files at once
 - `argdo normal @w` then `:wa`

---

#### iteration
 - `:let i = 1`
 - record macro with `<C-r>=i`
 - in macro do `:let i += 1`

---

#### plain text macro edit
 (much preferred to use appending)
 - `:put w`
 - change plain text
 - `0"wy$`

---
