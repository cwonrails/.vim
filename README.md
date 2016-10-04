# A [modular] Neo/Vim configuration!

Nearly every Neo/Vim configuration you find online is composed of a single,
giant `vimrc` file.  But _this one is different_: it's [modular], relying on
Vim's behavior of loading all `plugin/**/*.vim` files on startup to cleanly
partition your settings, mappings, bundles, and other configuration out into
separate little files that all focus on a single topic and _do one thing well_.

<!-- vim-markdown-toc GFM -->
* [Features](#features)
* [Organization](#organization)
  * [Branches](#branches)
  * [Scripts](#scripts)
  * [Bundles](#bundles)
  * [Configs](#configs)
* [Dependencies](#dependencies)
* [Installation](#installation)
* [Usage](#usage)
  * [Bundling](#bundling)
  * [Updating](#updating)
  * [Locking](#locking)
* [Shortcuts](#shortcuts)
  * [Cheatsheet](#cheatsheet)
  * [Leader](#leader)
  * [Space](#space)
  * [Command](#command)
  * [Buffer](#buffer)
  * [Quit](#quit)
  * [Window](#window)
  * [Fold](#fold)
  * [Text object](#text-object)
  * [Operator](#operator)
  * [Search](#search)
  * [Select](#select)
  * [Yank](#yank)
  * [Autosuggestion](#autosuggestion)
  * [Git integration](#git-integration)
  * [URxvt integration](#urxvt-integration)
* [Manuals](#manuals)
  * [bin/clean](#binclean)
  * [bin/delete](#bindelete)
  * [bin/insert](#bininsert)
  * [bin/orphans](#binorphans)
  * [bin/rebase](#binrebase)
  * [bin/rebase-autocon](#binrebase-autocon)
  * [bin/rebase-stacked](#binrebase-stacked)
  * [bin/rename](#binrename)
  * [bin/rename-editor](#binrename-editor)
  * [bin/rename-editor-urlname](#binrename-editor-urlname)
  * [bin/rename-fromto](#binrename-fromto)
  * [bin/setup](#binsetup)
  * [bin/update](#binupdate)
  * [bin/usage](#binusage)
  * [bin/usage-readme](#binusage-readme)
* [References](#references)
* [License](#license)

<!-- vim-markdown-toc -->

## Features

* Modularity of bundles, filetypes, colorschemes, and Vim settings.

* Lazy loading of filetype-specific bundles to start Vim up quickly.

* Parallel installation and updating of bundles from Git repositories.

* Easy upgrades with intelligent and automated Git conflict resolution.

* Shell scripts for bundle management: insert, delete, rename, and more.

## Organization

### Branches

* The **[master]** branch is a "bare bones" template for anyone to start with.
[master]: https://github.com/sunaku/.vim/tree/master#readme

* The **[basics]** branch is a rudimentary configuration of the Standard Vim.
[basics]: https://github.com/sunaku/.vim/tree/basics#readme

* The **[qwerty]** branch is the usual configuration meant for QWERTY typists.
[qwerty]: https://github.com/sunaku/.vim/tree/qwerty#readme

* The **[dvorak]** branch is an unusual configuration meant for Dvorak typists.
[dvorak]: https://github.com/sunaku/.vim/tree/dvorak#readme

### Scripts

* `bin/*` scripts automate common tasks.  See below for their usage manuals.

### Bundles

* `**/*.get` files specify URLs of Git repositories to clone for your bundles.

* `**/*.set` files specify branch names or commit SHAs to check out from Git.

* `**/*.run` files specify shell commands to run after updating your bundles.

* `bundle/*/*/` directories are eagerly loaded Vim scripts; see [Unbundle].

* `ftbundle/*/*/` directories are lazily loaded, filetype-specific bundles.

### Configs

* `plugin/**/*.vim` configure Vim _before_ it finishes starting up.

* `bundle/*/*.vim` configure your bundles _before_ they are loaded.

* `ftbundle/*/*.vim` configure your ftbundles _before_ they are loaded.

* `ftplugin/{*,/*}.vim` configure your filetypes _when_ they are loaded.

* `recolor/*.vim` configure your colorschemes _after_ they are applied.

* `after/plugin/**/*.vim` configure Vim _after_ it finishes starting up.

## Dependencies

* [Vim](http://www.vim.org/) 7+ or [NeoVim](https://neovim.io/) 0.1+

* [Git](http://git-scm.com/) 1.5+

* [POSIX] environment (Linux, BSD, MacOSX, etc.)
  [POSIX]: http://pubs.opengroup.org/onlinepubs/9699919799/

    Special note to Microsoft Windows users: simply

    * replace `~/.vim` with `%USERPROFILE%\vimfiles`
    * replace `~/.vimrc` with `%USERPROFILE%\_vimrc`

    in all commands listed throughout this document.

* [xargs](http://www.openbsd.org/cgi-bin/man.cgi/OpenBSD-current/man1/xargs.1)
  with support for the `-r` command-line option:

    > Do not run the command if there are no arguments.  Normally the
    > command is executed at least once even if there are no arguments.

[Unbundle]: https://github.com/sunaku/vim-unbundle

## Installation

Backup your configuration:

    mv ~/.vim ~/.vim.bak
    mv ~/.config/nvim ~/.config/nvim.bak # for NeoVim

Install this configuration:

    git clone https://github.com/sunaku/.vim.git ~/.vim
    ln -s ~/.vim ~/.config/nvim  # for NeoVim
    cd ~/.vim
    bin/setup

Select a Git branch to use:

    bin/setup           # bare bones
    bin/setup basics    # bare bones + basic config
    bin/setup qwerty    # bare bones + basic config + the usual
    bin/setup dvorak    # bare bones + basic config + the usual + my flair

## Usage

See usage information:

    bin/usage

See usage information for provided *SCRIPT*:

    bin/usage SCRIPT

### Bundling

Add bundle from *URL* under *CATEGORY*:

    bin/insert URL bundle/CATEGORY

Add bundle from *URL* under *CATEGORY* with *BUNDLE_NAME*:

    bin/insert URL bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from *URL* for *FILETYPE*:

    bin/insert URL ftbundle/FILETYPE

Add ftbundle from *URL* for *FILETYPE* with *BUNDLE_NAME*:

    bin/insert URL ftbundle/FILETYPE/BUNDLE_NAME

Add bundle from Github *USER*/*REPO* under *CATEGORY*:

    bin/insert USER/REPO bundle/CATEGORY

Add bundle from Github *USER*/*REPO* under *CATEGORY* with *BUNDLE_NAME*:

    bin/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME

Add ftbundle from Github *USER*/*REPO* for *FILETYPE*:

    bin/insert USER/REPO ftbundle/FILETYPE

Add ftbundle from Github *USER*/*REPO* for *FILETYPE* with *BUNDLE_NAME*:

    bin/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

Rename bundles with names matching *BUNDLE_NAME* (regexp):

    bin/rename BUNDLE_NAME

Rename all bundles from the comfort of Vim:

    bin/rename-editor BUNDLE_NAME

Rename a `*.get` file from its current name to a new one:

    bin/rename-fromto CURRENT_GET_FILE NEW_GET_FILE

Delete bundles with names matching *BUNDLE_NAME* (regexp):

    bin/delete BUNDLE_NAME

Lists untracked `*.get` files and bundles lacking `*.get` files:

    bin/orphans

Deletes untracked `*.get` files and bundles lacking `*.get` files:

    bin/clean        # asks you for confirmation
    bin/clean -f     # no confirmation; force it

### Updating

Update installed bundles and ftbundles:

    bin/update

Update this Vim configuration framework:

    bin/rebase      # asks to confirm bin/clean
    bin/rebase -f   # no confirmation; force it

Do all that periodically via crontab(1):

    @daily cd ~/.vim && bin/rebase -f && bin/update

### Locking

Lock a *BUNDLE* to a certain Git *COMMIT* to prevent it from being updated:

    cd BUNDLE
    git checkout COMMIT

Unlock a locked *BUNDLE* so that it can be updated again:

    cd BUNDLE
    git checkout master

## Shortcuts

This branch of the Vim configuration defines the following shortcuts, which
assume that you [type in Dvorak]( http://www.dvzine.org/zine/01-toc.html ).
If this assumption doesn't apply to you, then try the [qwerty] branch instead.

* `<C-C>` is like `<Esc>` but it doesn't break macros containing the Alt key.
* Run `stty -ixon` before launching Vim to use `<C-S>` and `<C-Q>` shortcuts.

### Cheatsheet

This listing is *always* available in Vim: just press the **space bar** twice!

Shortcut | Description
---------|------------
``-`` | (sneak) repeat the most recent Sneak forward
``<C-Q>`` | quit vim
``<C-S>`` | strip trailing whitespace in buffer and write buffer to file
``<C-\>h`` | vim's original `h` key
``<C-\>l`` | vim's original `l` key
``<Leader><C-Q>`` | quit vim forcefully
``<Leader><Leader>K`` | (dasht) search ALL the docsets for cursor word or selected text
``<Leader><Leader>k`` | (dasht) search ALL the docsets at command prompt
``<Leader>K`` | (dasht) search related docsets for cursor word or selected text
``<Leader>P`` | paste before cursor, adding a space
``<Leader>[[`` | blockwise surround at start and end of line
``<Leader>[]`` | blockwise insert at start then end of line
``<Leader>]]`` | blockwise surround at start and end of line
``<Leader>a`` | blockwise append at end of line
``<Leader>b`` | go to start of current word in camel/snake case
``<Leader>e`` | go to end of current word in camel/snake case
``<Leader>ge`` | go to end of previous word in camel/snake case
``<Leader>i`` | blockwise insert at start of line
``<Leader>k`` | (dasht) search related docsets at command prompt
``<Leader>p`` | paste after cursor, adding a space
``<Leader>q[[`` | blockwise execute at start and end of line
``<Leader>q[]`` | blockwise execute at start then end of line
``<Leader>q]]`` | blockwise execute at start and end of line
``<Leader>qa`` | blockwise execute at end of line
``<Leader>qi`` | blockwise execute at start of line
``<Leader>w`` | go to start of next word in camel/snake case
``<P`` | Paste before cursor, linewise, decreasing indent.
``<Space>!!`` | repeat recent test run
``<Space>!F`` | run all tests in suite
``<Space>!f`` | run all tests in file
``<Space>!n`` | run test under cursor
``<Space>!v`` | edit recently ran test
``<Space>#`` | fuzzy-regex search in buffer
``<Space>$t`` | move tab to last place
``<Space>%g`` | git diff file
``<Space>&`` | interactive search and replace
``<Space>'*`` | (unite) go to line in buffer matching word at cursor
``<Space>':`` | (unite) repeat command from history
``<Space>']`` | (unite) go to ctag in any buffer
``<Space>'b`` | (unite) go to buffer or file in git/history
``<Space>'f`` | (unite) go to file in git/history/directory
``<Space>'g`` | (unite) go to file in git
``<Space>'l`` | (unite) go to line in buffer
``<Space>'m`` | (unite) go to mark or jump in buffer
``<Space>'r`` | (unite) paste from register
``<Space>'t`` | (unite) go to tab
``<Space>'w`` | (unite) go to window
``<Space>*`` | interactive search and replace for word at cursor
``<Space>/d`` | ferret search directory
``<Space>/g`` | git grep files in repository
``<Space>/r`` | ferret search and replace in all quickfix files
``<Space>1`` | go to tab number 1
``<Space>2`` | go to tab number 2
``<Space>3`` | go to tab number 3
``<Space>4`` | go to tab number 4
``<Space>5`` | go to tab number 5
``<Space>6`` | go to tab number 6
``<Space>7`` | go to tab number 7
``<Space>8`` | go to tab number 8
``<Space>9`` | go to tab number 9
``<Space>:u`` | (unite) command prompt
``<Space><C-A>`` | increment number sequence
``<Space><C-X>`` | decrement number sequence
``<Space><H`` | minimum window height
``<Space><S`` | minimum window size
``<Space><Space>`` | show shortcut menu and run chosen shortcut
``<Space><W`` | minimum window width
``<Space><h`` | decrease window height
``<Space><s`` | decrease window size
``<Space><t`` | move tab left
``<Space><w`` | decrease window width
``<Space>=w`` | equal window sizes
``<Space>>H`` | maximum window height
``<Space>>S`` | maximum window size
``<Space>>W`` | maximum window width
``<Space>>h`` | increase window height
``<Space>>s`` | increase window size
``<Space>>t`` | move tab right
``<Space>>w`` | increase window width
``<Space>Ag`` | amend git commit
``<Space>At`` | append new tab in last place
``<Space>Cb`` | resolve merge conflict by keeping both versions
``<Space>Cn`` | resolve merge conflict by removing both versions
``<Space>Co`` | resolve merge conflict by keeping our version
``<Space>Ct`` | resolve merge conflict by keeping their version
``<Space>Db`` | close all buffers in session
``<Space>Dg`` | git remove file forcefully
``<Space>Dt`` | close other tabs
``<Space>Dw`` | close other windows
``<Space>Dz`` | close all other folds in buffer
``<Space>Eg`` | git revert buffer
``<Space>Gt`` | go to last tab
``<Space>It`` | insert new tab in first place
``<Space>Lg`` | git blame file
``<Space>Nt`` | go to previous tab
``<Space>Nw`` | focus previous window
``<Space>Od`` | browse working directory
``<Space>Of`` | (unite) go to file in directory
``<Space>Ow`` | split window above
``<Space>P%`` | diff put hunk into left window
``<Space>Rb`` | force reload buffer from file
``<Space>Rg`` | git revert file forcefully
``<Space>Wb`` | write buffer to file
``<Space>Wg`` | git add all changes in buffer
``<Space>Wx`` | (slimux) send buffer to target pane
``<Space>Xg`` | git rename file forcefully
``<Space>Yf`` | save copy of file as...
``<Space>^t`` | move tab to first place
``<Space>`` | fallback to shortcut menu on partial entry
``<Space>`b`` | (unite) go to section in buffer outline
``<Space>`f`` | (unite) go to relative file in git/history/directory
``<Space>`g`` | git status
``<Space>a%`` | diff obtain hunk from right window
``<Space>ag`` | git commit changes
``<Space>at`` | append new tab
``<Space>aw`` | split window right
``<Space>c$`` | comment from cursor to end of line
``<Space>c@`` | comment as ASCII art using FIGlet
``<Space>cA`` | append comment at end of line
``<Space>cP`` | duplicate before cursor and then comment
``<Space>ca`` | comment using alternate delimiters
``<Space>cb`` | comment, aligning both delimiters
``<Space>cc`` | comment
``<Space>ci`` | invert comment markers
``<Space>cl`` | comment, aligning left delimiter
``<Space>cm`` | comment, minimally
``<Space>cn`` | comment, nesting
``<Space>cp`` | duplicate after cursor and then comment
``<Space>cs`` | comment, sexily
``<Space>ct`` | toggle comment markers
``<Space>cu`` | uncomment
``<Space>cy`` | yank and then comment
``<Space>d$`` | strip trailing whitespace in buffer
``<Space>db`` | close buffer while retaining window
``<Space>df`` | prompt to remove file
``<Space>dg`` | git remove file
``<Space>dt`` | close tab
``<Space>dw`` | close window
``<Space>e!`` | (unite) repeat filter from history
``<Space>e/`` | (fzf) repeat search from history
``<Space>e:`` | (fzf) run command
``<Space>e;`` | (fzf) repeat command from history
``<Space>e?`` | (fzf) go to line in any file in directory
``<Space>eB`` | (fzf) apply filetype to buffer
``<Space>eF`` | (fzf) go to file from history
``<Space>eG`` | (fzf) go to file in git status
``<Space>eK`` | (fzf) go to git commit
``<Space>eL`` | (fzf) go to line in any buffer
``<Space>eM`` | (fzf) run mapping
``<Space>e[`` | (fzf) go to ctags in buffer
``<Space>e\`` | (fzf) go to file in filesystem
``<Space>e]`` | (fzf) go to ctag in any buffer
``<Space>eb`` | (fzf) go to buffer
``<Space>ec`` | (fzf) apply colorscheme
``<Space>ef`` | (fzf) go to file in directory
``<Space>eg`` | (fzf) go to file in git repository
``<Space>eh`` | (fzf) show help topic
``<Space>ek`` | (fzf) go to git commit for buffer
``<Space>el`` | (fzf) go to line in buffer
``<Space>em`` | (fzf) go to mark in buffer
``<Space>es`` | (unite) apply spelling suggestion
``<Space>ew`` | (fzf) go to window
``<Space>gg`` | git workflow using emacs-style magit
``<Space>gt`` | go to first tab
``<Space>h"`` | convert single to double quotes at cursor
``<Space>h'`` | convert double to single quotes at cursor
``<Space>h(`` | format function call, removing parentheses
``<Space>h)`` | format function call, adding parentheses
``<Space>h-`` | format as separator, appending minus signs
``<Space>h.`` | format as separator, repeating last character
``<Space>h1`` | format as markdown title heading ``<h1>``
``<Space>h2`` | format as markdown section heading ``<h2>``
``<Space>h:`` | format ruby quotes to symbol at cursor
``<Space>h;`` | format ruby symbol to quotes at cursor
``<Space>h<Space>`` | indent with spaces in buffer
``<Space>h<Tab>`` | indent with tabs in buffer
``<Space>h=`` | format as separator, appending using equal signs
``<Space>hJ`` | format elixir pipeline from multi to single-line at cursor
``<Space>hP`` | format elixir function call to pipeline at cursor
``<Space>ha`` | toggle multi-line syntax at cursor
``<Space>hc`` | format as markdown fenced code block
``<Space>hj`` | format elixir pipeline from single to multi-line at cursor
``<Space>hp`` | format elixir pipeline to function call at cursor
``<Space>hs`` | cycle alternate syntax at cursor
``<Space>ht`` | format as markdown table heading ``<th>``
``<Space>i%`` | diff obtain hunk from left window
``<Space>it`` | insert new tab
``<Space>iw`` | split window left
``<Space>lg`` | show buffer's git commits
``<Space>nt`` | go to next tab
``<Space>nw`` | focus next window
``<Space>od`` | browse buffer's directory
``<Space>of`` | (unite) go to relative file in directory
``<Space>ow`` | split window below
``<Space>ox`` | (slimux) choose target pane
``<Space>p%`` | diff put hunk into right window
``<Space>pg`` | git preview hunk at cursor
``<Space>pw`` | paste window
``<Space>r%`` | diff against original version
``<Space>rb`` | reload buffer from file
``<Space>rg`` | git revert file
``<Space>t#`` | toggle highlighting css/hex color code
``<Space>t*`` | toggle highlighting word at cursor
``<Space>t<Bar>`` | toggle table editing mode
``<Space>tD`` | go to pomodoro archive
``<Space>tG`` | toggle git hunk highlighting
``<Space>tS`` | toggle semantic identifier highlighting
``<Space>tV`` | toggle distraction coloring (limelight)
``<Space>t]`` | toggle ctag sidebar
``<Space>t^`` | toggle indentation lines
``<Space>td`` | show pomodoro to-do's
``<Space>tg`` | toggle git hunk signs
``<Space>tl`` | toggle location list
``<Space>tq`` | toggle quickfix list
``<Space>tr`` | toggle register list
``<Space>tt`` | toggle f/F/t/T target highlighting
``<Space>tv`` | toggle distractions (goyo)
``<Space>u.`` | show timelapse replay of undo history
``<Space>ug`` | git revert hunk at cursor
``<Space>uu`` | toggle undo-tree sidebar
``<Space>vb`` | visually select buffer
``<Space>wb`` | strip trailing whitespace in buffer and write buffer to file
``<Space>wg`` | git stage hunk at cursor
``<Space>wx`` | (slimux) send line or selection to target pane
``<Space>xf`` | rename file
``<Space>xg`` | git rename file
``<Space>yb`` | yank buffer contents
``<Space>yf`` | save file as...
``<Space>yw`` | yank window
``<Space>zR`` | widen view / disable narrowing
``<Space>zv`` | narrow view to selection
``<p`` | Paste after cursor, linewise, decreasing indent.
``=P`` | Paste before cursor, linewise, reindenting.
``=p`` | Paste after cursor, linewise, reindenting.
``>P`` | Paste before cursor, linewise, increasing indent.
``>p`` | Paste after cursor, linewise, increasing indent.
``S`` | (sneak) go to {characters} in text before cursor
``ZA`` | align all folds
``ZC`` | append end foldmarker of level [count] with comment
``ZD`` | delete foldmarker from current line
``ZF`` | append start foldmarker of level [count] with comment
``Za`` | align all folds of level [count]
``Zc`` | append end foldmarker of level [count]
``Zf`` | append start foldmarker of level [count]
``[%`` | go to starting line of same indent, ascending [count] indents
``[+`` | go to previous line of deeper indent
``[-`` | go to previous line of lesser indent
``[<C-L>`` | go to previous file with locations
``[<C-Q>`` | go to previous file with quickfixes
``[<Space>`` | Add [count] blank lines above the cursor.
``[=`` | go to previous line of same indent, crossing different indents
``[A`` | go to first argument
``[B`` | go to first buffer
``[L`` | go to first location
``[Q`` | go to first quickfix
``[T`` | go to first ctag
``[_`` | go to previous line of [count] indent
``[a`` | go to previous argument
``[b`` | go to previous buffer
``[e`` | Exchange current line with [count] lines above it.
``[f`` | go to previous file in current file's directory
``[g`` | go to previous git hunk in buffer
``[l`` | go to previous location
``[n`` | go to previous conflict marker or diff/patch hunk
``[oC`` | hicterm enable cterm color code highlighting
``[ob`` | enable assuming light background
``[oc`` | enable highlighting cursor's line
``[od`` | enable diffing with current buffer
``[oh`` | enable highlighting search results
``[oi`` | enable ignoring case sensitivity
``[ol`` | enable listing nonprintable characters
``[on`` | enable absolute line numbering
``[or`` | enable relative line numbering
``[os`` | enable checking for misspelled words
``[ou`` | enable highlighting cursor's column
``[ov`` | enable constraining cursor to line
``[ow`` | enable wrapping very long lines
``[ox`` | enable highlighting cursor's position
``[p`` | Paste after cursor, linewise.
``[q`` | go to previous quickfix
``[t`` | go to previous ctag
``[u`` | URL escape.
``[uu`` | URL escape current line.
``[x`` | XML escape.
``[xx`` | XML escape current line.
``[y`` | String escape.
``[yy`` | String escape current line.
``]%`` | go to ending line of same indent, descending [count] indents
``]+`` | go to next line of deeper indent
``]-`` | go to next line of lesser indent
``]<C-L>`` | go to next file with locations
``]<C-Q>`` | go to next file with quickfixes
``]<Space>`` | Add [count] blank lines below the cursor.
``]=`` | go to next line of same indent, crossing different indents
``]A`` | go to last argument
``]B`` | go to last buffer
``]L`` | go to last location
``]Q`` | go to last quickfix
``]T`` | go to last ctag
``]_`` | go to next line of [count] indent
``]a`` | go to next argument
``]b`` | go to next buffer
``]e`` | Exchange current line with [count] lines below it.
``]f`` | go to next file in current file's directory
``]g`` | go to next git hunk in buffer
``]l`` | go to next location
``]n`` | go to next conflict marker or diff/patch hunk
``]oC`` | hicterm disable cterm color code highlighting
``]ob`` | disable assuming light background
``]oc`` | disable highlighting cursor's line
``]od`` | disable diffing with current buffer
``]oh`` | disable highlighting search results
``]oi`` | disable ignoring case sensitivity
``]ol`` | disable listing nonprintable characters
``]on`` | disable absolute line numbering
``]or`` | disable relative line numbering
``]os`` | disable checking for misspelled words
``]ou`` | disable highlighting cursor's column
``]ov`` | disable constraining cursor to line
``]ow`` | disable wrapping very long lines
``]ox`` | disable highlighting cursor's position
``]p`` | Paste before cursor, linewise.
``]q`` | go to next quickfix
``]t`` | go to next ctag
``]u`` | URL unescape.
``]uu`` | URL unescape current line.
``]x`` | XML unescape.
``]xx`` | XML unescape current line.
``]y`` | String unescape.
``]yy`` | String unescape current line.
``_`` | (sneak) repeat the most recent Sneak backward
``cH`` | change automatic delimiters surrounding {motion}
``ch`` | change specified delimiters surrounding {motion}
``coQ`` | toggle automatic formatting in buffer
``cob`` | toggle assuming light background
``coc`` | toggle highlighting cursor's line
``cod`` | toggle diffing with current buffer
``coh`` | toggle highlighting search results
``coi`` | toggle ignoring case sensitivity
``col`` | toggle listing nonprintable characters
``con`` | toggle absolute line numbering
``cor`` | toggle relative line numbering
``cos`` | toggle checking for misspelled words
``cou`` | toggle highlighting cursor's column
``cov`` | toggle constraining cursor to line
``cow`` | toggle wrapping very long lines
``cox`` | toggle highlighting cursor's position
``coz`` | toggle code folding in buffer
``dH`` | remove automatic delimiters surrounding {motion}
``dh`` | remove specified delimiters surrounding {motion}
``g<`` | swap delimited item to the left
``g>`` | swap delimited item to the right
``g@`` | decorate {motion} or selection as ASCII art using FIGlet
``gA`` | inspect syntax highlighting group at cursor
``gG`` | show function, method, or class name at cursor
``gJ`` | join lines at cursor into a single lines
``gS`` | split line at cursor into multiple lines
``g[`` | show ctag at cursor
``ga`` | inspect Unicode character at cursor
``gr`` | Replace {motion} text with the contents of specified register.
``grr`` | Replace [count] lines with the contents of specified register.
``gs`` | swap delimited item interactively
``h`` | surround {motion} or selection with specified delimiters
``l`` | enter insert mode to substitute character at cursor
``s`` | (sneak) go to {characters} in text after cursor
``yH`` | yank line and surround with specified delimiters
``yO`` | Paste before cursor, linewise, using set 'paste'.
``yh`` | yank {motion} and surround with specified delimiters
``yo`` | Paste after cursor, linewise, using set 'paste'.

To generate the above listing, run this command in Vim:

```vim
call append('.', sort(values(map(copy(g:shortcuts), '"``". v:key ."`` | ". v:val'))))
:'<,'>s/ | .*\zs<.\{-}>/``&``/g
```

### Leader

* `,` is the `<Leader>`, used in _some_ shortcuts in this configuration.

### Space

* `<Space>` (space bar) precedes _most_ shortcuts in this configuration.
  Press it and wait for 2 seconds for searchable menu of all shortcuts.
* `<Space><Space>` immediately opens a searchable menu of all shortcuts.

### Command

* `;` puts Vim into command mode. It is a shift-less alternative to `:`.

### Buffer

* `<C-S>` saves the current buffer after stripping trailing whitespace.

### Quit

* `<C-Q>` quits Vim (after confirmation if you have any unsaved buffers).

### Window

Focus:

* `<A-d>` focuses previously focused tmux pane.
* `<A-h>` focuses window at left.
* `<A-t>` focuses window above.
* `<A-n>` focuses window below.
* `<A-s>` focuses window at right.

Scroll:

* `<C-Left>` scrolls window left.
* `<C-Right>` scrolls window right.
* `<C-S-Left>` scrolls window all the way left.
* `<C-S-Right>` scrolls window all the way right.

### Fold

Jump:

* `<C-Up>` jumps to nearest fold above current line.
* `<C-Down>` jumps to nearest fold below current line.
* `<C-S-Up>` jumps to nearest section above current line.
* `<C-S-Down>` jumps to nearest section below current line.

Fold:

* `<A-Down>` opens current fold.
* `<A-S-Down>` opens current fold and any folds contained therein.
* `<A-Up>` closes current fold.
* `<A-S-Up>` closes current fold and any folds contained therein.

Level:

* `<A-Left>` closes folds at current level.
* `<A-S-Left>` closes all folds.
* `<A-Right>` opens folds at next level.
* `<A-S-Right>` opens all folds.

### Text object

* `<Space>` is for [whitespace](https://github.com/vim-utils/vim-space).
* `=` is for [merge conflict](https://github.com/rhysd/vim-textobj-conflict).
* `c` and `C` are for [vertical columns](https://github.com/coderifous/textobj-word-column.vim).
* `g` is for [Git hunks](https://github.com/airblade/vim-gitgutter).
* `h` and `H` are for [surrounded text](https://github.com/machakann/vim-sandwich).
* `i` is for [indentation](https://github.com/thinca/vim-textobj-between).
* `l` is for [the current line](https://github.com/kana/vim-textobj-line).
* `o` and `O` are for [code comments](https://github.com/glts/vim-textobj-comment).
* `q` is for [quoted text](https://github.com/beloglazov/vim-textobj-quotes).
* `r` is for block structures in VimL and Ruby.
* `u` is for [URLs](https://github.com/mattn/vim-textobj-url).
* `v` is for [variable names](https://github.com/robmiller/vim-movar).
* `y` is for [syntax elements](https://github.com/kana/vim-textobj-syntax).
* `<Leader>w` is like `w` but knows about [CamelCaseMotion].
* `<Leader>b` is like `b` but knows about [CamelCaseMotion].
* `<Leader>e` is like `e` but knows about [CamelCaseMotion].
[CamelCaseMotion]: https://github.com/bkad/CamelCaseMotion

### Operator

* `Q` formats the current paragraph or text selection using `gq`.

### Search

* `<C-L>` clears search highlighting; also recalculates hunks when diffing.
* `-` repeats the current `f`,`F`,`t`,`T` forward like the original `;` does.
* `_` repeats the current `f`,`F`,`t`,`T` backward like the original `,` does.

### Select

* `gV` visually selects the most recently pasted text.
* `gn` selects the nearest search result after the cursor.
* `gN` selects the nearest search result before the cursor.

### Yank

* `Y` yanks from cursor to end of line, like Vim's native `C` and `D` keys.
* `<Leader>y` copies the current visual selection to the system clipboard.

### Autosuggestion

See [NeoComplete.vim](https://github.com/Shougo/neocomplete.vim)
and [NeoSnippet.vim](https://github.com/Shougo/neosnippet.vim).

In insert mode, when the auto-completion pop-up menu appears:

* `<Return>` accepts chosen completion and starts new line.
* `<Tab>` cycles through completion menu or snippet anchors.
* `<C-J>` expands snippet for chosen completion.
* `<C-E>` accepts common prefix of completion choices.
* `<C-U>` forgets chosen completion so you can choose again.
* `<C-G>` cancels completion.

### Git integration

See [Magit](https://github.com/jreybert/vimagit#readme)
and [Fugitive.vim](https://github.com/tpope/fugitive#readme)
and [Extradite.vim](https://github.com/int3/vim-extradite#readme)
and [GitGutter.vim](https://github.com/airblade/vim-gitgutter#readme).

### URxvt integration

If you use Vim in the URxvt terminal emulator, then load the following
snippet into xrdb(1) so you can use all the shortcuts defined in this
Vim configuration:

    xrdb -merge ~/.vim/urxvt.xrdb

## Manuals

The usage manual for each script is reproduced here, for your convenience.

### bin/clean

Deletes untracked `*.get` files and bundles lacking `*.get` files,
as well as any files or directories seen as waste by git-clean(1).

    Usage: bin/clean        # asks you for confirmation
    Usage: bin/clean -f     # no confirmation; force it

### bin/delete

Deletes existing bundles whose names match the given regular expression.

    Usage: bin/delete [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP

### bin/insert

Inserts a new bundle, optionally named BUNDLE_NAME, into the given CATEGORY.
You can specify USER/REPO in place of URL to insert from GitHub repositories.

    Usage: bin/insert [URL|USER/REPO] [ft]bundle/CATEGORY[/BUNDLE_NAME]

    Usage: bin/insert URL bundle/CATEGORY
    Usage: bin/insert URL bundle/CATEGORY/BUNDLE_NAME
    Usage: bin/insert URL ftbundle/FILETYPE
    Usage: bin/insert URL ftbundle/FILETYPE/BUNDLE_NAME

    Usage: bin/insert USER/REPO bundle/CATEGORY
    Usage: bin/insert USER/REPO bundle/CATEGORY/BUNDLE_NAME
    Usage: bin/insert USER/REPO ftbundle/FILETYPE
    Usage: bin/insert USER/REPO ftbundle/FILETYPE/BUNDLE_NAME

### bin/orphans

Lists untracked `*.get` files and bundles lacking `*.get` files.

    Usage: bin/orphans

### bin/rebase

Replays local commits atop the newest changes from upstream.

    Usage: bin/rebase      # asks to confirm bin/clean
    Usage: bin/rebase -f   # no confirmation; force it

### bin/rebase-autocon

    Usage: git-rebase-autocon [TARGET] [ARGUMENTS_FOR_GIT_REBASE...]

Rebases the given TARGET while automatically resolving conflicts
by substituting empty-tree commits labeled "fixup!" that log all
conflicting hunks in their commit messages in git-diff(1) format.

If TARGET is not specified, the upstream tracking branch is used.
Optional ARGUMENTS_FOR_GIT_REBASE... are passed to git-rebase(1).

Documented at <https://sunaku.github.io/git-rebase-autocon.html>

### bin/rebase-stacked

Rebases the main branches, going from conventional to divergent.

### bin/rename

Renames existing bundles whose names match the given regular expression.

    Usage: bin/rename [OPTIONS_FOR_GREP...] BUNDLE_NAME_REGEXP

At the prompt, edit the bundle location and press ENTER to rename it so.
If you no longer wish to rename the bundle, just press ENTER to skip it.
If you made a mistake and want to abort the rename, press Control and C.

### bin/rename-editor

Lets you rename all *.get files in one fell swoop, from the comfort of Vim.

    Usage: bin/rename-editor [OPTIONS_FOR_VIM...]

Simply rename the lines you're interested in and then save and quit, but be
careful not to change the order or amount of lines presented in the editor!

To cancel without performing any renames, type "ggdG:wqa" followed by ENTER.

### bin/rename-editor-urlname

Attempts to rename bundles back to their URL basenames.

    Usage: bin/rename-editor-urlname [OPTIONS_FOR_VIM...]

### bin/rename-fromto

Renames the given *.get file and all associated files to the new name.

    Usage: bin/rename-fromto CURRENT_GET_FILE NEW_GET_FILE

### bin/setup

Activates the given BRANCH and installs any bundles it defines.

    Usage: bin/setup [BRANCH]

    Usage: bin/setup         # bare bones
    Usage: bin/setup basics  # bare bones + basic config
    Usage: bin/setup qwerty  # bare bones + basic config + the usual
    Usage: bin/setup dvorak  # bare bones + basic config + the usual + my flair

### bin/update

    Usage: bin/update [BUNDLE_NAME|DIRECTORY|GET_FILE]...
    Usage: env UPDATE_BUNDLES_SEQUENTIALLY=1 bin/update

Clones or updates the Git repositories specified in `./**/*.get` files:
optionally matching the given BUNDLE_NAME, DIRECTORY, or GET_FILE path,
starting from the most recently modified file down to the earliest one,
checking out the branch or commit named in related `./**/*.set` files.
After that, it runs corresponding `./**/*.run` scripts for those repos.

This is done in parallel, at up to half of the maximum process limit,
unless the `UPDATE_BUNDLES_SEQUENTIALLY` environment variable is set.

### bin/usage

Displays help and usage information for this and fellow scripts.

    Usage: bin/usage [SCRIPT]

### bin/usage-readme

Formats usage information from all scripts for injection into README.

## References

* [Plugin Layout in the Dark Ages][modular] by Steve Losh.
  [modular]: http://learnvimscriptthehardway.stevelosh.com/chapters/42.html

* [Configuring Vim right](http://items.sjbach.com/319/configuring-vim-right)
  by Stephen Bach.

* [Replacing All The Things with Unite.vim](
  http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
  ) by Christopher Sexton.

## License

> Like my work? :+1: Please [spare a life] today as thanks!
> :cow::pig::chicken::fish::speak_no_evil::v::revolving_hearts:
[spare a life]: https://sunaku.github.io/vegan-for-life.html

Copyright 2009 Suraj N. Kurapati <https://github.com/sunaku>

Distributed under the terms of the ISC license (basically MIT).
