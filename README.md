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

## マシン固有の設定

リポジトリに入れない設定は次のファイルに書く。

- `~/.zshrc.local`
- `~/.gitconfig.local`（`[user]` の上書きなど）
