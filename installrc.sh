if [ $# -eq 0 ]
then
    dir=.
else
    dir=$1
fi


# Downloading vimrc
curl https://raw.githubusercontent.com/dzerus3/vimrc/master/.vimrc > $dir/.vimrc

# Making directories
mkdir -p $dir/.vim
mkdir -p $dir/.vim/autoload
mkdir -p $dir/.vim/bundle

# Installing pathogen
curl -LSso $dir/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Installing the plugins
cd $dir/.vim/bundle
git clone https://github.com/dense-analysis/ale.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/Townk/vim-autoclose.git
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/wesQ3/vim-windowswap.git

cd $dir
# Installing exuberant ctags
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz -O - | tar xz
cd ctags-5.8
./configure
make

if [ "$EUID" -ne 0 ]
then
    echo "You need administrator priviledges for the next part."
    echo "Run this again as sudo, or navigate to ctags-5.8, run sudo make install, and remove the ctags directory."
else
    make install
    cd ..
    rm -rf ctags-5.8
fi
