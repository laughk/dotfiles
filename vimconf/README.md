# このVim設定ファイルのセットアップ方法
このリポジトリを適当な場所にcloneして、以下の手順を行なってください。

## Windows環境の場合
windowsブランチをcheckoutして、そちらのREADMEを見てください。

## Unix系環境

1. manage.sh で大体のセットアップをします:

    ```sh
    ## 通常の場合
    ./manage.sh setup

    ## サーバなどでgvimrcが不要な場合
    ./manage.sh -c setup
    ```

2. プラグインのインストール:  
セットアップ後初回は以下のコマンドで起動。  
`NeoBundle`経由でプラグインのインストール, `vimproc`のコンパイルが始まります。

    ```sh
    vim +NeoBundleInstall
    ```

