# このVim設定ファイルのセットアップ方法
このリポジトリを適当な場所にcloneして、以下の手順を行なってください。

## Windows環境の場合
windowsブランチをcheckoutして、そちらのREADMEを見てください。

## Unix系環境

1.manage.sh で大体のセットアップをします:

    ## 通常の場合
    ./manage.sh setup
    
    ## サーバなどのCUIのみ必要の場合
    ./manage.sh -c setup

2.プラグインのインストール:  
セットアップが完了したらvimを起動してみてください。  
最初はエラーが出ますが、無視して起動し、以下のコマンドを実行します。

    :NeoBundleInstall

[NeoBundle](https://github.com/Shougo/neobundle.vim)で管理されているプラグインがインストールされます。  
インストールが完了したら、一旦vimを閉じます。

3.vimprocのコンパイル:  
インストールされるプラグインでvimshellなどはvimprocが必要になりますが、  
[vimproc](https://github.com/Shougo/vimproc)を使うにはコンパイルをする必要があります。  
以下のようにします。

    cd ~/.vim/bundle/vimproc
    
    ## Linuxの場合
    make -f make_unix.mak
    
    ## Macの場合
    make -f make_mac.mak

vimprocの詳細はリンク先を参照してください。

以上でセットアップ完了です。
