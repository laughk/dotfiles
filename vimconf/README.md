## Windows

7.4 以上で `mklink` コマンドで

```
%USERPROFILE%\vimfilesd <===> このリポジトリの dotifile/vimconf/vim
```

みたいな感じでシムリンク貼れば動くかもしれないけど最近windowsでこの設定を使ってないのでわかりません



## Unix系環境

```sh
./vim-setup.sh
```

消したい時

```sh
./vim-setup.sh clean
```

やれば消えるけど、やってることは `~/.vim` を unlink するだけ。
