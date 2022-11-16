# ソフトウェアをインストールする準備
## xcode-select のインストール
- `xcode-select --install`

## Homebrew のインストール
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### 補足
- Homebrew のページ
  - https://brew.sh/index_ja

# Mac 本体の設定
## 指紋認証の設定
- システム環境設定 → Touch ID

## 諸々の設定
- defaults.sh を実行する
- 対象を探すのに役に立ったサイト（特に windows 風キー操作とか）
  - https://baqamore.hatenablog.com/entry/2015/02/09/221934
  - http://www.neko.ne.jp/~freewing/software/macos_mojave_speed_up_setting_tips/
  - https://github.com/kevinSuttle/macOS-Defaults/blob/master/.macos

## Karabiner の設定
### 補足
- caps_lock → left_control に変更
- 外部キーボードに関する設定は繋いだ状態でやる
- なんかうまく反映されない時は karabiner を再起動したら直った

## Homebrew
- `brew bundle` を実行し、色々インストールする
