#!/usr/bin/env ruby
$home = ENV["HOME"]
`mkdir -p #{$home}/.vim/`
def get_pathogen()
  Dir.mkdir("#{$home}/.vim/autoload")
  Dir.mkdir("#{$home}/.vim/bundle")
  `curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`
end

if File.exist?("#{$home}/.vim/autoload/pathogen.vim")
else 
  get_pathogen()
end

$bundle_path = $home + "/.vim/bundle"

def git_grab(url, name, hash_prefix)
  if File.exist?($bundle_path + "/#{name}")
  	return
  else
    system <<-END_GIT_CLONE
      cd #{$bundle_path} && \\
      git clone #{url} #{name}
    END_GIT_CLONE
  end
  system <<-END_GIT_CHECKOUT
    cd #{$bundle_path}/#{name} && \\
    git checkout #{hash_prefix} 
  END_GIT_CHECKOUT
end

# vim-arpeggio
git_grab(
  "https://github.com/kana/vim-arpeggio",
  "vim-arpeggio",
  "d2a8214956511fbd199faf85ec39519d86700f67"
)

# supertab!
git_grab(
  "https://github.com/ervandew/supertab",
  "supertab",
  "c8bfeceb1fc92ad58f2ae6967cbfcd6fbcb0d6e7"
)

# nerdree
git_grab(
  "https://github.com/scrooloose/nerdtree/",
  "nerdtree",
  "a87b1bf3c566c3f80090996a2a2a1201318478a8"
)

# ctags.vim
git_grab(
  "https://github.com/vim-scripts/ctags.vim",
  "ctags.vim",
  "a438a4f580c9445744c25941185c8cb8fb6b79b9"
)

# ctrl-p
git_grab(
  "https://github.com/kien/ctrlp.vim",
  "ctrlp.vim",
  "b5d3fe66a58a13d2ff8b6391f4387608496a030f"
)

# nerd-commenter
git_grab(
  "https://github.com/scrooloose/nerdcommenter",
  "nerdcommenter",
  "6549cfde45339bd4f711504196ff3e8b766ef5e6"
)

# vim sensible
git_grab(
  "https://github.com/tpope/vim-sensible",
  "vim-sensible",
  "d0beb8ab42627bea2c747564ca46ec663e3ba0ba"
)

# vim fugitive
git_grab(
  "https://github.com/tpope/vim-fugitive/",
  "vim-fugitive",
  "03cc95cc198ea94a6a003a92cd0e58af4416ec25"
)

# vim-colorstepper (patched with exit hook)
git_grab(
  "https://github.com/gregory-nisbet/vim-colorstepper",
  "vim-colorstepper",
  "e87629b6e77de99edb3b286264e856883abe2317"
)

# bufexplorer
git_grab(
    "https://github.com/jlanzarotta/bufexplorer",
    "bufexplorer",
    "ef7e4172944dd2d2911ccef501a0119b63c80449"
)

# mru.vim
git_grab(
    "https://github.com/vim-scripts/mru.vim",
    "mru.vim",
    "9f25db66393a6467fae0ac04ae6565e8471023c3"
)

# vim version of emacs kill ring
git_grab(
    "https://github.com/vim-scripts/YankRing.vim",
    "YankRing.vim",
    "28854abef8fa4ebd3cb219aefcf22566997d8f65"
)

# fuzzy finder 
git_grab(
    "https://github.com/gregory-nisbet/fzf",
    "fzf",
    "87d0d3e3b6e0f49f2467472a0a0ecd547e187358"
)
