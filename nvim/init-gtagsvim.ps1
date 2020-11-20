$ErrorActionPreference = "Stop"

$global_version = "6.6.5"
$global_tgz = ("global-" + $global_version + ".tar.gz")
$global_url = ("https://ftp.gnu.org/pub/gnu/global/" + $global_tgz)
$nvim_plugin_dir = ($PSScriptRoot + "\plugin")
$temporary_dir = ($PSScriptRoot + "\.temp.d")

if (!(gcm tar -ea SilentlyContinue)) {
  echo "Not Fount: 'tar'"
  echo
  echo "このスクリプトは tar コマンドに依存しています"
  echo "scoop や choco などで tar コマンドをインストールしてください"
  echo
  exit 1
}

try {

  mkdir $temporary_dir | Out-Null
  cd $temporary_dir

  Invoke-WebRequest $global_url -OutFile $global_tgz
  tar xf $global_tgz *.vim
  cp ("global-" + $global_version + "\*.vim") $nvim_plugin_dir

}
finally {

  cd $PSScriptRoot
  if (Test-Path $temporary_dir) {
    Remove-Item $temporary_dir -Recurse -Force
  }
}

