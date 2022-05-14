Import-Module posh-git
# Import-Module oh-my-posh
Import-Module ZLocation
Import-Module posh-docker
Import-Module AWSCompleter
Import-Module AWS.Tools.Common 

# environment
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
$env:Path += ";C:\Users\laughk\.local\bin"

# Alias
del alias:diff -Force
Set-Alias diff $env:USERPROFILE\scoop\apps\git\current\usr\bin\diff.exe


# prompt
# --------------------------------------
$GitPromptSettings.EnableFileStatus = $true
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $true
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = "`n"
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 0xFFA500

function prompt {
    $prompt = "`n"

    if (!($env:AWS_VAULT -eq $null)) {

        $prompt += "`e[33m[aws-vault::" + $env:AWS_VAULT
        if ((Get-Date).Ticks -gt (Get-Date $env:AWS_SESSION_EXPIRATION).Ticks) {
            $prompt += "`e[31m (expired!!:" + $env:AWS_SESSION_EXPIRATION + ")"
        }
        $prompt += "`e[33m]`e[0m"

    }

    if (Test-Path -PathType Leaf .terraform\environment) {
        $prompt += "`e[38;5;104m[workspace::" + $(cat .terraform\environment) + "]`e[0m"
    }

    if (!($env:VIRTUAL_ENV -eq $null)) {
        $venvName = Split-Path -Leaf $env:VIRTUAL_ENV
        $pyVersion = $(python -V) -Replace "python ",""
        $prompt += "`e[32m[🐍" + $venvName + "::" + $pyVersion + "]`e[0m"
    }

    $prompt += "`n"
    $prompt += & $GitPromptScriptBlock
    $prompt.Replace(">", "`e[36m%`e[0m")
}

# emacs mode に
# ----------------------------------------
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None


# fzf
# ----------------------------------------
function gf { # ghq のディレクトリに移動する君
    $path = ghq list | Invoke-Fzf
    if ($LastExitCode -eq 0) {
        cd "$(ghq root)\$path"
    }
}

function historyFzf { # hitory を fuzzy search して実行するクン
    # from. https://gist.github.com/nv-h/081684cee2505cd336e26c2660fc7541
    $command = Get-Content (Get-PSReadlineOption).HistorySavePath | Sort-Object | Get-Unique | fzf
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($command)
}

function petSearch {
    $command = pet search
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($command)
}


# AWS Access Key for Terraform
# ----------------------------------------
function set_aws_cred {

  if (!($env:AWS_ACCESS_KEY_ID -eq $null)) {
    $env:TF_VAR_aws_access_key = $env:AWS_ACCESS_KEY_ID
  }
  if (!($env:AWS_SECRET_ACCESS_KEY -eq $null)) {
    $env:TF_VAR_aws_secret_key = $env:AWS_SECRET_ACCESS_KEY
  }
  if (!($env:AWS_SESSION_TOKEN -eq $null)) {
    $env:TF_VAR_aws_session_token = $env:AWS_SESSION_TOKEN
  }

}

# keybind
# ----------------------------------------
# 実行後入力待ちになるため、AcceptLine を実行する
Set-PSReadLineKeyHandler -Chord 'Ctrl+]' -ScriptBlock { gf; [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine() }
Set-PSReadLineKeyHandler -Chord 'Ctrl+;' -ScriptBlock  { Invoke-FuzzyZLocation; [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine() }
Set-PSReadLineKeyHandler -Chord 'Ctrl+r' -ScriptBlock  { historyFzf }
Set-PSReadLineKeyHandler -Chord 'Ctrl+?' -ScriptBlock  { petSearch }
Set-PSReadLineKeyHandler -Chord 'Ctrl+U' -ScriptBlock  { searchDBUsers }

# ~\.pwsh_config.ps1 がある場合読み込む
if (Test-Path -PathType Leaf ($env:USERPROFILE + "\.pwsh_config.ps1")) {
  . ($env:USERPROFILE + "\.pwsh_config.ps1")
}
