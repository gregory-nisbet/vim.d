#!/bin/sh
set -euf
mkdir -p "$HOME"/.vim

# get pathogen and set up files
mkdir -p "$HOME"/.vim/autoload
mkdir -p "$HOME"/.vim/bundle
if [ -f "$HOME"/.vim/autoload/pathogen.vim ]; then
    :
else
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi


bundle_path="$HOME"/.vim/bundle

# git_grab expects url name and hash_prefix to be set
# prior to invocation
git_grab() {
    if [ -f "$bundle_path"/"$name" ]; then
        :
    else
        (cd "$bundle_path" && git clone "$url" "$name")
    fi
    (cd "$bundle_path"/"$name" && git checkout "$hash_prefix")
}

# vim-arpeggio
url="https://github.com/kana/vim-arpeggio"
name="vim-arpeggio"
hash_prefix="d2a8214956511fbd199faf85ec39519d86700f67"
git_grab

# supertab!
url="https://github.com/ervandew/supertab"
name="supertab"
hash_prefix="c8bfeceb1fc92ad58f2ae6967cbfcd6fbcb0d6e7"
git_grab

# nerdree
url="https://github.com/scrooloose/nerdtree/"
name="nerdtree"
hash_prefix="a87b1bf3c566c3f80090996a2a2a1201318478a8"
git_grab

# ctags.vim
url="https://github.com/vim-scripts/ctags.vim"
name="ctags.vim"
hash_prefix="a438a4f580c9445744c25941185c8cb8fb6b79b9"
git_grab

# ctrl-p
url="https://github.com/kien/ctrlp.vim"
name="ctrlp.vim"
hash_prefix="b5d3fe66a58a13d2ff8b6391f4387608496a030f"
git_grab

# nerd-commenter
url="https://github.com/scrooloose/nerdcommenter"
name="nerdcommenter"
hash_prefix="6549cfde45339bd4f711504196ff3e8b766ef5e6"
git_grab

# vim sensible
url="https://github.com/tpope/vim-sensible"
name="vim-sensible"
hash_prefix="d0beb8ab42627bea2c747564ca46ec663e3ba0ba"
git_grab

# vim fugitive
url="https://github.com/tpope/vim-fugitive/"
name="vim-fugitive"
hash_prefix="03cc95cc198ea94a6a003a92cd0e58af4416ec25"
git_grab

# vim-colorstepper (patched with exit hook)
url="https://github.com/gregory-nisbet/vim-colorstepper"
name="vim-colorstepper"
hash_prefix="e87629b6e77de99edb3b286264e856883abe2317"
git_grab

# bufexplorer
url="https://github.com/jlanzarotta/bufexplorer"
name="bufexplorer"
hash_prefix="ef7e4172944dd2d2911ccef501a0119b63c80449"
git_grab

# mru.vim
url="https://github.com/vim-scripts/mru.vim"
name="mru.vim"
hash_prefix="9f25db66393a6467fae0ac04ae6565e8471023c3"
git_grab

# vim version of emacs kill ring
url="https://github.com/vim-scripts/YankRing.vim"
name="YankRing.vim"
hash_prefix="28854abef8fa4ebd3cb219aefcf22566997d8f65"
git_grab

# fzf is good for you
url="https://github.com/gregory-nisbet/fzf/"
name="fzf"
hash_prefix="87d0d3e3b6e0f49f2467472a0a0ecd547e187358"
git_grab

# I don't actually use this thing ever
# you complete me
#git_grab(
#    "https://github.com/Valloric/YouCompleteMe",
#    "youcompleteme",
#    "96f0d94196c4cf0697938465bee2b3a30310b7b3"
#)
