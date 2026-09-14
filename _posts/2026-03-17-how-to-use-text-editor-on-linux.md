# how to use text editor in linux
# paste in linux

Pasting in Linux depends on **where you’re pasting (terminal, Vim, GUI, etc.)**. Here’s a clear guide 👇

---

# 🖥️ 1. Paste in Linux Terminal

Most terminals (like GNOME Terminal) use:

### ✅ Paste shortcut:

* **Ctrl + Shift + V**

### ✅ Copy:

* **Ctrl + Shift + C**

👉 Regular `Ctrl + V` usually **does NOT work** in terminal.

---

# 🖱️ 2. Middle-click paste (very important)

Linux has a second clipboard called **selection clipboard**:

* Select text → it’s automatically copied
* Click **middle mouse button (scroll wheel)** → paste

👉 Works almost everywhere

---

# 📋 3. Paste in GUI apps (browser, editor, etc.)

Standard shortcuts:

* **Ctrl + V** → paste
* **Ctrl + C** → copy

---

# 🧠 4. Paste inside Vim

### If using system clipboard:

```vim
"+p
```

### If pasting from terminal (to avoid formatting issues):

```vim
:set paste
```

Then press:

* `Ctrl + Shift + V`

After pasting:

```vim
:set nopaste
```

---

# ⚙️ 5. Paste in TTY (no GUI, like Ctrl+Alt+F3)

Use:

* **Shift + Insert**

---

# 🔑 Quick cheat sheet

| Context         | Paste Shortcut   |
| --------------- | ---------------- |
| Terminal        | Ctrl + Shift + V |
| GUI apps        | Ctrl + V         |
| Vim (clipboard) | `"+p`            |
| TTY             | Shift + Insert   |
| Mouse           | Middle click     |

---

If you want, I can show you how to **sync Vim with system clipboard permanently** so copy/paste just works like normal apps.


# shift insert
**Shift + Insert** is a keyboard shortcut used to **paste text**, especially in Linux terminals and older systems.

---

## 🧠 What it means

* **Shift** → the key you hold down
* **Insert (Ins)** → a key on your keyboard (usually near Delete, Home, Page Up)

👉 Press them together:

```
Hold Shift + press Insert
```

---

## 🖥️ Where it’s used

### 1. Linux terminal / console

In terminals like GNOME Terminal:

* **Shift + Insert = Paste**
* Works even when `Ctrl + V` doesn’t

---

### 2. TTY (no GUI mode)

When you switch to a pure console (e.g., `Ctrl + Alt + F3`):

* **Shift + Insert is often the main paste shortcut**

---

### 3. Legacy / universal behavior

This shortcut comes from older systems and still works in many programs as a **universal paste fallback**.

---

## 🔑 Why it exists

In terminals:

* `Ctrl + V` is often reserved for special purposes (like inserting control characters)
* So **Shift + Insert** became the reliable paste method

---

## ⚠️ If your keyboard doesn’t have “Insert”

* Laptops sometimes map it to:

  * `Fn + Enter`
  * `Fn + Del`
  * or another key

---

## 🔁 Quick comparison

| Shortcut         | Action                     |
| ---------------- | -------------------------- |
| Ctrl + V         | Paste (GUI apps)           |
| Ctrl + Shift + V | Paste (terminal)           |
| Shift + Insert   | Paste (universal/terminal) |

---

If you want, I can show you how to remap paste keys or check what your Insert key is on your specific keyboard.


# paste into vim's comman mode

To paste copied text into Vim's command mode (after typing :), press Ctrl + R followed by the double-quote key ".
Here is the quick step-by-step workflow:
## 1. Copy (Yank) the Text

   1. Press Esc to enter Normal Mode.
   2. Press v to enter Visual Mode and select your text.
   3. Press y to yank (copy) it.

## 2. Paste into the Command Line

   1. Type : to open Command Mode.
   2. Press Ctrl + R.
   3. Press " (the double-quote key). The text will instantly appear at your cursor.

------------------------------
## Useful Shortcuts for Other Clipboard Registers
Depending on where your text is coming from, you can swap out the final key after pressing Ctrl + R:

* Ctrl + R then + (or *): Pastes text directly from your system clipboard (outside of Vim).
* Ctrl + R then 0: Pastes your last explicitly yanked text (prevents deleted text from overwriting your copy).
* Ctrl + R then Ctrl + W: Automatically grabs the word currently under your cursor and drops it into the command line.

Are you trying to run a specific Vim command with this text, or do you need help enabling system clipboard integration?



## vim
### how to copy from vim to linux clipboard

### how to paste from linux clipboard to vim





### remove YouCompleteMe
To remove **YouCompleteMe** from your Vim setup, the steps depend on how you installed it (most likely via **vim-plug** or **Vundle**).

---

  Step 1: Remove from `.vimrc`

Open your config:

```bash
vim ~/.vimrc
```

Find and **delete or comment out** the line:

or (Vundle):

```vim
Plugin 'ycm-core/YouCompleteMe'
```

---

  Step 2: Remove plugin files


 If using Vundle:

```bash
rm -rf ~/.vim/bundle/YouCompleteMe
```

---

  Step 3: Remove compiled files (important )

YouCompleteMe installs compiled binaries. Clean them:

```bash
rm -rf ~/.vim/bundle/YouCompleteMe
```

---

  Step 4: Optional cleanup (recommended)

Remove extra config (if you added any):

```vim
" Delete lines like:
let g:ycm_*
```

---

  Step 5: Restart Vim

```bash
vim
```

---

  Quick Summary

| Step | Action                            |
| ---- | --------------------------------- |
| 1    | Remove from `.vimrc`              |
| 2    | Run `:PlugClean` or delete folder |
| 3    | Remove compiled files             |
| 4    | Restart Vim                       |

---
### how to remove vundle
To remove **Vundle** from Ubuntu (or any Linux), you just need to clean up your Vim config and delete its files.

---

 Step 1: Remove Vundle from `.vimrc`

Open your config:

```bash
vim ~/.vimrc
```

Delete or comment out these lines:

```vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin lines...

call vundle#end()
filetype plugin indent on
```

 Also remove any `Plugin '...'` lines

---

 Step 2: Delete Vundle directory

```bash
rm -rf ~/.vim/bundle/Vundle.vim
```

---

 Step 3: Remove all Vundle-installed plugins (optional)

If you want a clean slate:

```bash
rm -rf ~/.vim/bundle
```

---



 Quick Summary

| Step | Action                     |
| ---- | -------------------------- |
| 1    | Edit `.vimrc`              |
| 2    | Delete `Vundle.vim` folder |
| 3    | Remove plugins (optional)  |
| 4    | Restart Vim                |

---

### how to install vim-plug


## how to install coc-nvim
To install **coc.nvim** (Conquer of Completion) in Vim, follow these steps carefully. It provides modern IDE-like features such as auto-completion, linting, and language support.

---

  Step 0: Install Node.js (required )

`coc.nvim` depends on Node.js.

```bash
sudo apt update
sudo apt install nodejs npm
```

Check:

```bash
node -v
npm -v
```

---

  Step 1: Install via vim-plug (recommended)

If youre using **vim-plug**, open your config:

```bash
vim ~/.vimrc
```

Add:

```vim
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
```

---

  Step 2: Install the plugin

Open Vim and run:

```vim
:PlugInstall
```

---

  Step 3: Basic configuration (important)

Add this to your `.vimrc`:

```vim
" Better completion behavior
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ "\<TAB>"

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use Enter to confirm completion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
```

---

  Step 4: Install language extensions

Inside Vim:

```vim
:CocInstall coc-json coc-tsserver coc-clangd coc-pyright
```

 Examples:

* `coc-clangd`  C/C++
* `coc-pyright`  Python
* `coc-tsserver`  JavaScript/TypeScript

---

  Step 5: Verify installation

Open a code file and:

* Start typing  auto-completion should appear
* Run:

```vim
:CocInfo
```

---

  Optional: Useful commands

| Command               | Description        |
| --------------------- | ------------------ |
| `:CocInstall`         | install extensions |
| `:CocUpdate`          | update coc.nvim    |
| `:CocList extensions` | list installed     |
| `gd`                  | go to definition   |
| `K`                   | show documentation |

---


  Summary

1. Install Node.js
2. Add plugin via vim-plug
3. Run `:PlugInstall`
4. Install extensions
5. Enjoy IDE features 

## coc-nvim gd and return

In coc.nvim, you already know:

* `gd`  **go to definition**

Now the natural question is: **how do you go back?** 

---

  Return after `gd`

  1. Use `Ctrl + o` (most important)

```vim
Ctrl + o
```

 This jumps **back to your previous location**

* Works after `gd`, `gi`, search, etc.
* Think: **jump back in history**

---

  2. Go forward again

```vim
Ctrl + i
```

 Moves forward (like browser forward button)

---

  Why this works

Vim keeps a **jump list**:

* `gd` adds a jump
* `Ctrl + o`  go backward in jumps
* `Ctrl + i`  go forward

---

  Example workflow

1. Cursor on function:

```c
add(2, 3);
```

2. Press:

```vim
gd
```

 jumps to definition

3. Press:

```vim
Ctrl + o
```

 returns to where you were

---

  Bonus: see jump history

```vim
:jumps
```

---

  Pro tips

 Open definition in split instead

```vim
Ctrl + w + }
```

 Or tab (with mapping):

```vim
nnoremap gD :tab split \| call CocAction('jumpDefinition')<CR>
```

---

  Summary

* `gd`  go to definition
* `Ctrl + o`  go back
* `Ctrl + i`  go forward

---




### how to configure coc-nvim for java



### how to configure coc-nvim for c/c++


Here’s a deeper look at the **popup menu (completion menu)** in coc.nvim inside Vim—how it works, how to control it, and how to customize it.

---

# 🧠 What the popup menu is

When you type, Coc shows a **completion popup** with:

* Suggestions (functions, variables, classes)
* Icons / kinds (ƒ function, v variable, etc.)
* Source (LSP, buffer, snippets)

👉 It’s powered by:

* Language server (like `clangd`, Java LSP, etc.)
* Vim’s built-in popup menu (`pum`)

---

# ⌨️ Default controls

### Navigation

```vim
Ctrl + n   " next item
Ctrl + p   " previous item
```

### Confirm selection

```vim
Ctrl + y
```

### Cancel

```vim
Ctrl + e
```

---

# ⚡ Recommended key setup (better UX)

Add this to `.vimrc`:

```vim
" Make completion behave nicely
set completeopt=menuone,noinsert,noselect

" Tab to navigate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Enter to confirm
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
```

👉 Result:

* `Tab` → next item
* `Shift+Tab` → previous
* `Enter` → confirm

---

# 📊 Understanding popup fields

A typical item shows:

```
printf    [Function]    stdio.h
```

* **Label** → `printf`
* **Kind** → Function
* **Source** → header / LSP info

---

# 🔍 Show more details (documentation popup)

When selecting an item:

```vim
K
```

👉 Shows:

* Function signature
* Docs
* Parameters

Or auto-trigger (see below)

---

# ⚙️ Coc settings (important)

Open:

```vim
:CocConfig
```

### Useful settings:

```json
{
  "suggest.noselect": false,
  "suggest.enablePreview": true,
  "suggest.maxCompleteItemCount": 20,
  "suggest.detailMaxLength": 100
}
```

---

# ✨ Auto popup behavior

Enable auto trigger:

```json
{
  "suggest.autoTrigger": "always"
}
```

👉 Suggestions appear as you type

---

# 🎯 Improve menu appearance

```json
{
  "suggest.floatEnable": true,
  "suggest.detailField": "menu",
  "suggest.labelMaxLength": 50
}
```

---

# 🔧 Scroll documentation window

When docs popup is open:

```vim
Ctrl + f   " scroll down
Ctrl + b   " scroll up
```

---

# 🚀 Advanced: manual trigger

Trigger completion manually:

```vim
Ctrl + Space
```

If not working:

```vim
inoremap <silent><expr> <C-Space> coc#refresh()
```

---

# ⚠️ Common issues

### ❌ Popup not showing

* Check:

```vim
:CocInfo
```

### ❌ Enter doesn’t confirm

Fix with:

```vim
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
```

---

# 🔑 Mental model

* Popup = list of suggestions
* `Ctrl+n / Ctrl+p` = move
* `Enter / Ctrl+y` = accept
* `K` = details

---

If you want, I can help you **make Coc look exactly like VS Code (icons, colors, smooth UI)**—it’s a big upgrade.





### how to use fzf.vim

### vim text manipulate stratey
vim select lines match patterns

Vim doesn't have a single command to "highlight" non-contiguous lines in Visual mode, but you can "select" them for an operation: 

Delete all lines matching "pattern":

:g/pattern/d

Keep only lines matching "pattern" (delete everything else):

:v/pattern/d or :g!/pattern/d


pattern match date time

This is the most common format for logs and databases. 

Standard (grep -E): [0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}

Vim (Search): /\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}

## emacs

## miscellecious
how to search text in multiple files in linux
Searching for text in multiple files is a standard task in Linux, primarily handled by the grep command or faster modern alternatives like ripgrep. [1, 2, 3] 
### 1. Using grep (The Standard Way)
The grep utility is pre-installed on almost every Linux system. [4, 5] 

* Search in current directory (no subfolders):

grep "search_term" *

* Search recursively (including subfolders):

grep -r "search_term" /path/to/directory

* Search only specific file types (e.g., .txt files):

grep -r --include="*.txt" "search_term" .

[2, 6, 7, 8, 9] 

Essential Flags:

* -i: Case-insensitive search (matches "Error", "error", and "ERROR").
* -n: Show the line number where the match was found.
* -l: Only list the names of files that contain the text.
* -w: Match only whole words (won't match "rooted" if you search for "root"). [2, 4, 6, 10, 11, 12] 

### 2. Using ripgrep (The Faster Way) [2, 13] 
ripgrep (command rg) is a modern, much faster alternative. It automatically respects your .gitignore and skips hidden files by default. [2, 14, 15, 16] 

* Recursive search (default behavior):

rg "search_term"

* Search specific file types:

rg -t py "search_term"  # Only search Python files

[2, 17, 18] 

### 3. Combining find and grep (For Advanced Filtering) [19, 20] 
If you need to filter files by properties like size or modification date before searching the text inside them, use find. [21] 

* Search only in files larger than 1MB:

find . -type f -size +1M -exec grep -l "search_term" {} +

* Search only in files modified in the last 7 days:

find . -type f -mtime -7 -exec grep "search_term" {} +

[2, 22, 23] 

## replace all date with the next date in vim
To replace dates with the "next date" in Vim, you can use the `:substitute` command combined with an external system call to the date utility.

The specific command depends on the date format you are currently using in your file.

ISO Format (YYYY-MM-DD)

If your dates are formatted as 2024-05-15, use this command:

```vim
:%s/\d\{4\}-\d\{2\}-\d\{2\}/\=system('date -d "' . submatch(0) . ' + 1 day" +%Y-%m-%d')->trim()/g
```
`\d\{4\}-\d\{2\}-\d\{2\}`: Matches the date pattern.

`\=`: Indicates the replacement is a Vim expression.

`system(...)`: Calls your computer's date command to add one day.

`trim()`: Removes the trailing newline character usually returned by system calls.

Tips for Success

Match Specificity: Ensure your regex pattern (the part between the first two /) accurately matches your dates to avoid accidental replacements.

Confirmation: If you want to review each change before it happens, add c to the end of the command: .../gc.

Environment: The system('date ...') call relies on the GNU date utility (common on Linux). If you are on macOS, you may need to install coreutils via Homebrew and use gdate instead of date in the command.

For more advanced date manipulation, you can explore using Vim's internal strftime() function.
