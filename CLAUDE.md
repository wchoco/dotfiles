# dotfiles

- 対象環境は WSL2 と ssh 先の Linux。macOS は対象外。Windows（PowerShell）では zellij の設定のみ共有する（`setup.ps1`）。
- zellij の `config.kdl` に `default_shell` を書かない。シェルは環境変数 `SHELL` で決まり、Windows では `config/powershell/profile.ps1` が設定する。
- 設定ファイルは `setup.sh` が symlink で配置する。ファイルを追加したら `setup.sh` の `link` にも追加し、README の表を更新する。
- ssh 先には sudo がなく、ツールが入っていないこともある。外部コマンドに依存する設定は `exist` で存在を確認してから使う。
- ツールのインストールは `init.sh` に書く。インストール先は `~/.local` とし、sudo を使わない。ツールを追加するときは `install_<tool>` と `update_<tool>` の両方を定義し、`TOOLS` に加える。
- マシン固有の設定や公開できない情報（リポジトリは public）は `~/.zshrc.local`、`~/.gitconfig.local` に置き、リポジトリに入れない。
- Claude Code のスキルはこのリポジトリでは管理しない（別プロジェクト）。
