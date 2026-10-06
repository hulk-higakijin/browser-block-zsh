# browser-block-zsh

拒否リストにある主要ブラウザを、通常のターミナルから Homebrew 経由でインストールできないようにする zsh 設定です。

## 対象

現在は次のパッケージ名を拒否します。

- `arc`
- `brave-browser`
- `chromium`
- `duckduckgo`
- `firefox`
- `google-chrome`
- `microsoft-edge`
- `opera`
- `orion`
- `tor-browser`
- `ungoogled-chromium`
- `vivaldi`
- `zen-browser`

`brew install`、`brew install --cask`、`brew cask install` に対応します。`brew upgrade` は拒否しません。

## インストール

リポジトリをホームディレクトリ直下に clone します。

```zsh
git clone git@github.com:hulk-higakijin/browser-block-zsh.git "$HOME/browser-block-zsh"
```

`.zshrc` に次を追加します。

```zsh
source "$HOME/browser-block-zsh/browser-block.zsh"
```

設定を反映します。

```zsh
source "$HOME/.zshrc"
```

## 制限事項

これは通常の `brew` コマンドを zsh 関数でラップする方式です。`/opt/homebrew/bin/brew` のように実体を直接指定する実行、別シェル、GUI、スクリプトからの直接実行は対象外です。
