# NOTES

# Navigation
## Indent
* `<` AND `>`: Shift line left or right
    * Relevant options: [`shiftwidth`, `shiftround`]

## Search
* `*` & `#`: Search next/previous occurrence of the word under the cursor



# NVIM
## Reload `init.lua`
* `luafile init.lua` in cmd mode

## Mapping
* `vim.keymap.set('MODE', 'KEYMAP', 'ACTION')`
    * MODE: `n` for normal, 'c' for command
    * ACTION: Can be a string or a callback

## Autocommand
* `vim.api.nvim_create_autocmd(event: str|str[], options: {pattern: str[], command: str)} | {pattern: str[], command: str)})`


# Cool shit
## `vim.bo`: Buffer options
