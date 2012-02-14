: ===============================================
: ホームディレクトリにハードリンクを張る
:  ※ linkd コマンドは要 windows server 2003 resource kit tools
: ===============================================
fsutil hardlink create "%USERPROFILE%\_vimrc" "%CD%\vimrc"
fsutil hardlink create "%USERPROFILE%\_gvimrc" "%CD%\gvimrc"
linkd "%USERPROFILE%\vimfiles" "%CD%\vim"

: ===============================================
: bundleディレクトリを作成
: ※ submodule の挙動がおかしくなるため、gitでここは管理しない
: ===============================================
mkdir "%CD%\vim\bundle"

: Vundle初回導入 -------------------------------------------------
git clone https://github.com/gmarik/vundle.git vim\bundle\vundle

: submodule に追加しているプラグインをインストールする -----------
git submoduele update --init
