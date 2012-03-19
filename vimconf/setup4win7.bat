: =====================================
: ホームディレクトリにハードリンクを張る（シンボリックリンクだと編集でリンクが切れるため）
: =====================================
mklink /H %homepath%\_vimrc %cd%\vimrc
mklink /H %homepath%\_gvimrc %cd%\gvimrc
mklink /D %homepath%\vimfiles %cd%\vim

: ====================================
: bundleディレクトリを作成
: ※ submodule の挙動がおかしくなるため、gitでここは管理しない
: ====================================
mkdir %cd%\vim\bundle

: Vundle初回導入  ----------------------------------------------
git clone git://github.com/Shougo/neobundle.vim.git %cd%\vim\bundle\neobundle.vim

: submodule に追加しているプラグインをインストールする --------
git submoduele update --init
