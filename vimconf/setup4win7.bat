:// ホームディレクトリにシンボリックリンクを張る
mklink %homepath%\_vimrc %cd%\vimrc
mklink %homepath%\_gvimrc %cd%\gvimrc
mklink /D %homepath%\vimfiles %cd%\vim

:// bundleディレクトリを作成
:// ※ submodule の挙動がおかしくなるため、gitでここは管理しない
mkdir %cd%\vim\bundle
:// Vundle初回導入
git clone https://github.com/gmarik/vundle.git %cd%\vim\bundle\vundle

:// submodule に追加しているプラグインをインストールする
git submoduele update --init
