# Update 10th October

Pablo recommended

> Personally, I wouldn't recommend a distro or even kickstart.nvim.

> I started my journey by working through the "practical vim" book by Drew Neil, and learning to use vim without any plugins or LSP (If you're using PyCharm, you can use the IdeaVim plugin to make the transition to modal editing easier).

> Then I started adding plugins (although you probably don't need plugins for python LSP support)

> Drew Neil's book has a chapter on using `vimgrep` and `cfdo` for simple refactors via the quickfix list. It's a great skill to have.
> But these days, I use the quicker.nvim plugin and a picker (like telescope.nvim) with ripgrep to enhance that workflow.

About LSP: The open source version of pyright is sluggish and missing features.
There is a fork called basedpyright, which is a significant improvement

But I don't use Python in large projects, so I don't know how well it works there

This one (still in alpha - by the same people who are behind uv) looks very promising:
https://github.com/astral-sh/ty

So, I decided to do it the proper way and RTFM.

Inspiration: Zazen codes
https://zazencodes.com/
https://github.com/zazencodes/dotfiles

which, crucially, is not using a distro.

So, I will now try a blank state neovim, and then code the stuff that is missing. I will be noting what I am learning too in this file.

So, from the neovim docs (https://neovim.io/doc/user/lua-guide.html):

- there are some magic folders in ~/.config/nvim/
  - anything in `/plugin` gets run automatically
  - if you want to run some files on demand, then you should do that in the `/lua` directory

Other bits and bobs: Autocommands are commands that get run at specific triggers.

# update 6th October.

So I discovered Henry Misc, who has a working Python setup. I failed miserably to get his setup working. The bit about not using ChatGPT or any of the other AI helps is especially true for the dotfiles configuration, I think, because every codebase is slightly different.

Henry Misc uses Kickstarter, which he then tweaks. I discovered that there are options on the bottom of the kickstarter init.lua which one simply needs to uncomment. The clear winner/new approved plugin is neotree, which I immediately found intuitive to use, and whose intuitive keybinding (the backslash key) I found particularly intuitive.

I tried LazyVIM and it is is really 'everything-out-of-the-box' but I found it slow, with a lot of distracting animations. I think I will revert back to 'Kickstarter plus' and in fact rebase my neovim.

I have also decided to start learning lua, because anything else is just clueless copy-and-paste from Stackoverflow. Another insight: the 'middle bit' of the init.lua file, where the plugins are configured, are just the arrays that lazy.nvim is expecting.

# update 4 October 2025

OK, so I have to report a complete failure in trying to setup my LSP for python. Neither Windsurf nor ChatGPT turned out to be useful.

I think I will switch to a 'distro' as recommended by DHH. He recommended Lazyvim and I think it is worth a try. All the previous configurations are in the git history of my dotfiles repo in any case.

Tmux and its default keybindings I find cool, and would like to continue using harpoon and telescope.

Samir told me that the autocomplete parenthesis was more of a hassle than an advantage, and I am slowly agreeing with him. I think it is going to be easier to just tell the editor what I want to see.

# update 7 September 2025

The line endings fiasco had to do with autocrlf settings, I have now just set them to false. What a waste of time.

Using neovim at work is making me improve my muscle memory. After just a couple of weeks of daily use using vscode for text editing just feels like wallowing in honey. It's so slow. I am also starting to get used to Harpoon, and it's blindingly fast. Jump to another file, yank something, go back to the original file. Super.

I have also started using some of the LSP functions such as rename and jump to definitions, but it's slow. C-i and C-o to navigate back/forwards is also super cool.

I discovered that neovim's swap files are in ~/.local/nvim/swap. Occasionally deleting everything in there helps avoid those mostly unwarranted neovim nags.

# update 21 August 2025

The chezmoi scripts turned out to be too much of a hassle. I finally started to get some reproducible stability by simplifying the scope.

Had some issues with line endings, tried to adress them with a .gitattributes directly in the chezmoi folder.

# update 9 August 2025

making some progress in the automated scripts. ChatGPT is proving good at making small suggestions and explaining individual lines.

Debugging the setup script on VSCode with the devcontainer is proving to be a bit cumbersome, but I am getting used to the concepts.

Neovim had to be installed from an image because kickstart needs a very recent version, which is not what comes with a a standard debian distro.

I followed the standard installation paths for dotfiles - it's called XDG and has already helped a lot.

Having the CAPS LOCK key mapped to Ctrl turned out to be the good choice. I am still having issues with the markdown preview neovim plugin but will probably remove this.

Ah, I also started understanding how the ssh keys work. Basically you need to start the ssh agent in the host, make some settings so that this agent is **mounted** in the container, and then everything works. A real 'AHA' moment -so **that's** how it works...

# update 28 July 2025

Development of this repo accelerated by my setup of devcontainers at my clients.
I initially tried to make chezmoi do all the setup, including software, but I have had issues with neovim installs on a debian base. Kickstart, which I have used up to now, has as a requirement a latest and greatest version of neovim 0.11.3.

Chatgpt is proving to be helpful but sometimes forgets point I made beforehand.

Today I merged the old files which were in dotfiles to my chezmoi managed repo of .dotfiles.

Once again, follow the defaults is the best advice.

# update July 2025

some new lessons, courtesy of the Primagean:

- low return on investment in doing aliases like `gs = git status`. It's a false economy.
- the single largest amount of time that can be optimized is **search time**. Primeagean mentions from top to bottom:
  - searching for the program. This should happen with a single key. For Windows I have this down pat with the Win+1, Win+2 keys, must find a way to do it on mac too
    - am going to try Hammerspoon, recommended by Chatgpt.
  - once within neovim, searching should be fuzzy (with telescope), and harpoon is a great single-key idea for this
- stick to default values for keybindings. Over time the ecosystem has settled around standards/defaults which work because they have been established since a long time. The danger of going 'this is my own keybinding' is that you might be clobbering the configuration.
- Once you have a configuration that works, stick to it.

I also discovered `typecraft`, another vim geek. He introduced the plugin nvim-tmux-navigator, which enables a pretty magical movement between the windows.

I also started editing and inputting the files for the crafting interpreters job, and I noticed that the standard way in vim to approve a suggestion from intellisense was C-y (for yes). At first I thought that this was unergonomic and wanted to immediately remap it to the more familiar tab, but the documentation makes an intense point not to do that.

The eye opener came when sylvain thingumbob suggested the remapping of the caps lock key to Ctrl. This should make loads of console tricks, ctrl-U for clearing the line, etc, a lot more ergonomic. If you look at the first teletype keyboards, the ctrl key was exactly placed where the caps lock key is. Gotta get used to escaping out of insert mode with C-[.

Had a talk with Samir. He confirmed that debugging a faulty configuration was huge pain in the ass.

# update June 2025

vim motions on IntelliJ working really well, using ideavim with connected IntelliJ actions is working well.

Customer is moving towards WSL development with a DevContainer. JetBrains IDEs don't work so well with Devcontainers, so a good opportunity to use neovim as main editor.

Setting up the Java Language server was a pain.

# update Jan 2025

my voyage is continuing

- using ideavim was really good
- really easy to get lost into bazillions of configurations
- every dev has his/her own choice, finely tuned.

installed fzf and it took me ages to understand that one had to press TAB after `\*\*.` so

```
cd ** TAB
```

is a super command to change directory. Add that to the cd command that brings you always to your home and we have a winner!

I tried messing around with TMUX but got again confused by too many keybindings.

new discovery with fzf: preview is just a question mark away. just press ?

made a change in .zshrc, Alt+C (Option+C) maps to the cedilla, I changed it to map to change directory.

# update April 2024

Pablo recommends using fzf mit fzf-vim

understanding chezmoi:

chezmoi files are actually stored in

`~/.local/share/chezmoi/dot_zshrc`

one edits the 'shadow documents' with

`chezmoi edit ~/.zshrc`

chezmoi cd to come to the 'shadow documents' home directory, from there one can
git push/git pull etc.

 

 

# update March 2023.

Decided to make a try with vimrc again.

had some issues with homebrew and vim install, solved it by uninstalling and
reinstalling vim with brew.vim

Some more sources:

<https://stackabuse.com/vim-for-python-development/>

 

> Lessons learned: vim makes only sense with an US keyboard.

 
Interesting idea: <https://www.youtube.com/watch?v=XA2WjJbmmoM&t=3706s>

don't use that many plugins.

 
Started using chezmoi as a dotfile manager.

<https://jerrynsh.com/how-to-manage-dotfiles-with-chezmoi/>

 

# update December 2021

Now I have a mac M1.

This article looks good:
https://technofob.com/2020/12/24/the-ultimate-mac-m1-terminal-iterm2-oh-my-zsh-zsh-syntax-highlighting/

https://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449

Installed oh-my-zsh, terminal looks a lot prettier now. /opt/homebrew is now the
place where homebrew installs itself, no need for sudo

. virtualenvs/isynth23/bin/activate

or source virtualenvs/isynth23/bin/activate

pg_config executable not found.

need to install separately brew install postgresql

pip install psycopg2-binary==2.9.1

.bash_profile / .bashrc When you open a new Terminal session, this file is
loaded by Bash. It loads in the other dotfiles
path,bash_prompt,exports,aliases,functions,extra and configures some useful
settings such as auto correcting typos when using cd completion.

In some instances .bashrc can be loaded, so this file makes sure that
.bash_profile is called.

.bashprofile on my computer contains the paths for python and java

https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
http://meta.ath0.com/2007/10/23/cleaning-up-bash-customizations/

Terminal applications run the shell indicated by the SHELL environment variable.
If this variable is unset, they run the login shell indicated in the user
database (/etc/passwd). You can request a different application when you start a
terminal emulator, e.g. xterm -e fish.

There are five startup files that zsh will read commands from:

\$ZDOTDIR/.zshenv \$ZDOTDIR/.zprofile \$ZDOTDIR/.zshrc \$ZDOTDIR/.zlogin
\$ZDOTDIR/.zlogout

## installing vim on a mac

Step 1. Install homebrew from here: http://brew.sh Step 1.1. Run export
PATH=/usr/local/bin:\$PATH Step 2. Run brew update Step 3. Run brew install vim
&& brew install macvim Step 4. Run brew link macvim

https://realpython.com/vim-and-python-a-match-made-in-heaven/
