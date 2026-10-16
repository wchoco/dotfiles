# dotfiles

WSL2 と ssh 先の Linux 向けの設定ファイル。

## セットアップ

```sh
git clone git@github.com:wchoco/dotfiles.git ~/.config/dotfiles
~/.config/dotfiles/init.sh   # ツールを ~/.local に入れる（sudo 不要、各項目で確認あり）
~/.config/dotfiles/setup.sh  # 設定ファイルへ symlink を張る
```

リポジトリは `~/.config/dotfiles` に置く前提（`.zshrc` が参照する）。

`init.sh` で入れたツールは `init.sh update` でまとめて更新できる。apt などで入れたツールは対象外。

`setup.sh` は何度実行してもよい。リンク先に既存のファイルがあれば `backup/<日時>/` に退避する。

## 管理しているもの

| 設定 | リンク先 |
|---|---|
| `config/zsh/.zshrc` | `~/.zshrc` |
| `config/vim/.vimrc` | `~/.vimrc` |
| `config/git/config`, `ignore` | `~/.config/git/` |
| `config/zellij/config.kdl` | `~/.config/zellij/config.kdl` |
| `config/claude/settings.json`, `keybindings.json` | `~/.claude/` |

zsh の設定は `config/zsh/` 以下に分割している。`wsl.zsh` は WSL 上でのみ読み込む。

## Windows（PowerShell）

Windows では zellij の設定を Linux と共有する。PowerShell で次を実行する。

```powershell
winget install --id Zellij.Zellij -e
git clone git@github.com:wchoco/dotfiles.git $HOME\.config\dotfiles
& $HOME\.config\dotfiles\setup.ps1
```

`setup.ps1` は `$PROFILE.CurrentUserAllHosts` に `config/powershell/profile.ps1` を読み込む行を追加する（何度実行してもよい）。
pwsh と Windows PowerShell はプロファイルの場所が別なので、使う方で実行する。
スクリプトの実行が拒否される場合は `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` を実行する。

`profile.ps1` の `zellij` 関数は、起動中の PowerShell を `SHELL` に、リポジトリの `config.kdl` を `ZELLIJ_CONFIG_FILE` に設定して zellij を起動する。
`config.kdl` に `default_shell` を書くと Linux と Windows の両方に効くので、書かない。

## マシン固有の設定

リポジトリに入れない設定は次のファイルに書く。

- `~/.zshrc.local`
- `~/.gitconfig.local`（`[user]` の上書きなど）
