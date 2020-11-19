# vimrc
This is my personal .vimrc file. It customizes very many things and implies that one has a bunch of plugins installed.

I put it here so I don't lose it and in case somebody finds it useful.
There is a more-or-less complete list of features in the comments at the top of the file. Presuming you have all the necessary plugins installed (the vimrc presumes you use pathogen) you should be fine with just dropping it into your home folder. It will tell you how to install ctags the first time you use it.

The vimrc was assembled using a wide variety of sources. Some of the more simple shortcuts and configurations are hand-made, but it also utilizes a bunch of tricks from the Vim wiki (such as C-h for binary view mode), StackOverflow, and the whole thing was based originally from [amix's vimrc](https://github.com/amix/vimrc).

Below is a copy-paste of an overview of the stuff I added/changed:

## Here are existing things this just enables
- Syntax highlighting is on.
- Line numbers are enabled.
- `y`anking in one vim window now carries over to other windows.
- On exit, vim saves where you were in the file and comes back there when you open it again.
- Vim now scrolls down as long as you are within 7 rows of the bottom of the screen.
- Tab length is set to 4.
- ~~You can undo things even after closing file. I think you can anyway.~~

## Here are things that were added within the vimrc.
- Leader key is bound to `,`.
- `:W` now goes into sudo and saves your file. Good if you edit /etc but forget to prepend `sudo` to the command.
- `Ctrl + d` deletes entire line without copying it.
- `Ctrl + d` in visual mode now deletes selection without copying.
- `Ctrl + a` is an alias for `^` (goes to first non-whitespace character on line).
- `Ctrl + e` is an alias for `$` (goes to last non-whitespace character on line).
- `Ctrl + j` makes everything past cursor a new line.
- `o` and `O` create a new line without going into edit mode. Controversial addition.
- `Ctrl + h` and `Ctrl + Backspace` toggles hexadecimal mode. May give a warning.
- Custom status line.
- `z` searches for selected text.
- `C-d` deletes a line or visual mode selection without copying it.

## Here are things related to tabs and windows.
- `Ctrl + n` open a new tab.
- `Ctrl + left/right arrow key` switches to the next tab in that direction.
- `Alt + arrow key` moves your cursor to the window which is in that direction.
- `Ctrl + w + number + < or >` increases or decreases window size by number characters.

## Here are things related to installed addons
- Parentheses and brackets will intelligently autoclose.
- `Ctrl + x` opens up an overview of all C++ functions and classes in current file.
- `:Z` toggles preventing the overview from changing when you move to a different window.
- `:Make` or `:m` calls make without exiting vim.
- `:Git` allows you to run any commands of Git without exiting vim.
- `Tab` while on an unfinished line of code attempts to do autocompletion. 
- When the suggestions pop up, press `Tab` again to scroll through them and `Shift + Tab` to scroll backward.
- `Ctrl + f` opens up a window which allows you to fuzzy search for files. 
- `Ctrl + y` while in Ctrl + f mode creates the file with the name you typed in.
- `gc` while selecting something comments out all selected lines. Works across just about all languages.
- `,a` goes to the next ALE error.
- `<Leader> ww` selects a window. Switching to another window and doing `<Leader> ww` again swaps the windows places.
