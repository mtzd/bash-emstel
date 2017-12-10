#!/bin/bash
GITVIM=false

if [ $# -gt 0 ]; then
  if [ $1 = "vim" ]; then
    GITVIM=true
  fi
fi


# git promt
if [ ! -f ~/.git-prompt ]; then
	curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt
fi

#configs
\cp configs/bashrc ~/.bashrc-emstel
\cp configs/jsbeautifyrc ~/.jsbeautifyrc
\cp configs/vimrc ~/.vimrc


if [ -a ~/.bashrc ]
then
  grep -q -F 'source ~/.bashrc-emstel' ~/.bashrc || echo 'source ~/.bashrc-emstel' >> ~/.bashrc
else
  echo "ERROR: No .bashrc found!"
fi

mkdir -p ~/.emstel
mkdir -p ~/.emstel/bin
mkdir -p ~/.emstel/data
mkdir -p ~/.emstel/templates

\cp templates/* ~/.emstel/templates/
\cp -n data/* ~/.emstel/data/

\cp bin/* ~/.emstel/bin/
chmod 755 ~/.emstel/bin/*


if [ "$GITVIM" = true ]; then
	mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	
	cd ~/.vim/bundle && git clone git://github.com/altercation/vim-colors-solarized.git
	cd ~/.vim/bundle && git clone https://github.com/scrooloose/nerdtree.git
	cd ~/.vim/bundle && git clone git://github.com/tpope/vim-rails.git && git clone git://github.com/tpope/vim-bundler.git
	cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim.git
	cd ~/.vim/bundle && git clone git://github.com/tpope/vim-endwise.git
	cd ~/.vim/bundle && git clone git://github.com/tpope/vim-commentary.git
	cd ~/.vim/bundle && git clone https://github.com/vim-ruby/vim-ruby.git
	cd ~/.vim/bundle && git clone https://github.com/ervandew/supertab.git              
	cd ~/.vim/bundle && git clone https://github.com/gregsexton/MatchTag.git
	cd ~/.vim/bundle && git clone git://github.com/tpope/vim-fugitive.git && vim -u NONE -c "helptags vim-fugitive/doc" -c q
	cd ~/.vim/bundle && git clone https://github.com/scrooloose/syntastic.git
	cd ~/.vim/bundle && git clone https://github.com/tomtom/tlib_vim.git
	cd ~/.vim/bundle && git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	cd ~/.vim/bundle && git clone https://github.com/garbas/vim-snipmate.git
	cd ~/.vim/bundle && git clone https://github.com/honza/vim-snippets.git
	cd ~/.vim/bundle && git clone https://github.com/leafgarland/typescript-vim.git
	cd ~/.vim/bundle && git clone https://github.com/HerringtonDarkholme/yats.vim.git
	cd ~/.vim/bundle && git clone https://github.com/Quramy/tsuquyomi.git
	cd ~/.vim/bundle && git clone https://github.com/Shougo/vimproc.vim.git 
	cd ~/.vim/bundle && git clone https://github.com/ngmy/vim-rubocop.git 
	cd ~/.vim/bundle && git clone https://github.com/Chiel92/vim-autoformat.git
	cd ~/.vim/bundle/vimproc.vim && make
fi

