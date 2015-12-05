require 'fileutils'
require 'pathname'

#TODO
#youcompleteme and supertab BOTH want control of the tab
#key
#I kind or sort of like them both, so I'll need to configure my way
#around this.
#the rakefile should be capable of managing configuration stuff like activating
#and decativating modules and updating modules
#for updating modules we probably need to move the modules to a YAML or JSON file
#outside of this one.

$vim_modules = []
def new_module(url, name, hash_prefix)
    $vim_modules.push([url, name, hash_prefix])
end

# vim-arpeggio
new_module(
  "https://github.com/kana/vim-arpeggio",
  "vim-arpeggio",
  "d2a8214956511fbd199faf85ec39519d86700f67"
)

# supertab!
new_module(
  "https://github.com/ervandew/supertab",
  "supertab",
  "c8bfeceb1fc92ad58f2ae6967cbfcd6fbcb0d6e7"
)

# nerdree
new_module(
  "https://github.com/scrooloose/nerdtree/",
  "nerdtree",
  "a87b1bf3c566c3f80090996a2a2a1201318478a8"
)

# ctags.vim
new_module(
  "https://github.com/vim-scripts/ctags.vim",
  "ctags.vim",
  "a438a4f580c9445744c25941185c8cb8fb6b79b9"
)

# ctrl-p
new_module(
  "https://github.com/kien/ctrlp.vim",
  "ctrlp.vim",
  "b5d3fe66a58a13d2ff8b6391f4387608496a030f"
)

# nerd-commenter
new_module(
  "https://github.com/scrooloose/nerdcommenter",
  "nerdcommenter",
  "6549cfde45339bd4f711504196ff3e8b766ef5e6"
)

# vim sensible
new_module(
  "https://github.com/tpope/vim-sensible",
  "vim-sensible",
  "d0beb8ab42627bea2c747564ca46ec663e3ba0ba"
)

# vim fugitive
new_module(
  "https://github.com/tpope/vim-fugitive/",
  "vim-fugitive",
  "03cc95cc198ea94a6a003a92cd0e58af4416ec25"
)

# vim-colorstepper (patched with exit hook)
new_module(
  "https://github.com/gregory-nisbet/vim-colorstepper",
  "vim-colorstepper",
  "e87629b6e77de99edb3b286264e856883abe2317"
)

# bufexplorer
new_module(
  "https://github.com/jlanzarotta/bufexplorer",
  "bufexplorer",
  "ef7e4172944dd2d2911ccef501a0119b63c80449"
)

# mru.vim
new_module(
  "https://github.com/vim-scripts/mru.vim",
  "mru.vim",
  "9f25db66393a6467fae0ac04ae6565e8471023c3"
)

# vim version of emacs kill ring
new_module(
  "https://github.com/vim-scripts/YankRing.vim",
  "YankRing.vim",
  "28854abef8fa4ebd3cb219aefcf22566997d8f65"
)

# fzf is good for you
new_module(
  "https://github.com/gregory-nisbet/fzf/",
  "fzf",
  "87d0d3e3b6e0f49f2467472a0a0ecd547e187358"
)

# you complete me
new_module(
    "https://github.com/Valloric/YouCompleteMe",
    "youcompleteme",
    "96f0d94196c4cf0697938465bee2b3a30310b7b3"
)

# typescript
new_module(
    "https://github.com/leafgarland/typescript-vim",
    "typescript",
    "a9c533386776d831f8098e66f2d0b43dfd42b06b"
)

task :vim_dir do
    Dir.chdir ENV["HOME"] do
        %w[.vim .vim/autoload .vim/bundle].each { |item|
            FileUtils::mkdir_p item
        }
    end
end

task :pathogen => [:vim_dir] do
    autodir = Pathname.new(ENV["HOME"]).join('.vim', 'autoload')
    Dir.chdir(autodir) {
        unless File.exist? 'pathogen.vim'
            sh 'curl -LSso pathogen.vim https://tpo.pe/pathogen.vim'
        end
    }
end

# git grab function with global variable whatever

def git_grab(url, name, hash_prefix)
    Dir.chdir($bundle_path) {
        if File.directory? name
            return
        elsif File.exists? name
            throw Exception.new("file already exists not directory") 
        end

        sh "git clone #{url} #{name}"
        Dir.chdir(name) {
            sh "git checkout #{hash_prefix}"
        }
    }
end

task :modules => [:vim_dir] do
    $bundle_path = Pathname.new(ENV["HOME"]).join(".vim", "bundle")

    $vim_modules.each { |item|
        git_grab(*item)
    }
end

task :default => [:vim_dir, :modules]
