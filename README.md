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
- caps_lock → left_control に変更
- 外部キーボードに関する設定は繋いだ状態でやる
- なんかうまく反映されない時は karabiner を再起動したら直った

# 開発環境の設定
## Homebrew
- 以下を実行し、色々インストールする
```
brew bundle
```

## zshrc
```
cp dotfiles/.vimrc ~/.zshrc

source ~/.zshrc
```

## ターミナルのログを移動
- 旧 PC の　~/.zsh_history を新 PC に移動（zsh_history_old）
- 新 PC で以下を実行
```
cat zsh_history_old >> ~/.zsh_history
```

## vimrc
```
cp dotfiles/.vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

- plugin のインストール（vim のコンソール内）
  - :PluginInstall

## SSH キーの設定
```
cd ~/.ssh
ssh-keygen -t rsa

pbcopy < ~/.ssh/id_rsa.pub
```

- 以下にアクセスし、SSH キーを追加
  - https://github.com/settings/ssh

- 以下で接続確認
```
ssh -T git@github.com
```

# iterm2 のセットアップ
## window 設定
- General > Window > Native full screen windows
  - false
- Profiles > Windows > Transparancy
  - 37
- Profiles > Windows > Style
  - Full Screen
- Profiles > Windows > Screen
  - Screen with Cursor
- Profiles > Windows > Space
  - All Spaces
- Profiles > Windows > Keys > General > Left Option key
  - Esc+
- Profiles > Windows > Keys > General > A hotkey opens a dedicated window with thid profile.
  - true
- Profiles > Windows > Keys > General > A hotkey opens a dedicated window with thid profile.
  - configure hotkey window
    - Pin hotkey window (stays open on loss of keyboard focus)
      - true
    - floating window
      - true
    - hotkey
      - option + space

## option arrow で単語移動
- Profiles > Windows > Keys > Key Mapping > 左下の+
  - 1 つ目
    - Keyboard Shortcut
      - option + →
    - Action
      - Send Escape Sequence
    - Esc+
      - f
  - 2 つ目
    - Keyboard Shortcut
      - option + ←
    - Action
      - Send Escape Sequence
    - Esc+
      - b

# clipy のセットアップ
- brew bundle 後に実行
  - cmd + shift + v → 設定
    - cmd + ctrl + v メイン
    - その他は削除

# Ruby 環境のセットアップ
- brew bundle 後に以下のコマンドを実行
```
rbenv init
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

rbenv install --list
rbenv install 3.1.2
rbenv global 3.1.2
```

# vscode 環境のセットアップ
## keybindings.json
```JSON
[
    {
        "key": "ctrl+;",                "command": "workbench.action.terminal.forcus",
                                        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+;",                "command": "workbench.action.forcusFirstEditorGroup",
                                        "when": "terminalFocus"
    }
]
```

## settings.jfon
```JSON
{
    "editor.tabSize": 2,
    // 入力補完を表示する
    "editor.quickSuggestions": {
        "comments": "on",
        "strings": "on",
        "other": "on"
    },
    "editor.renderLineHighlight": "all",
    "editor.cursorBlinking": "smooth",
    // 制御文字を表示
    "editor.renderControlCharacters": true,
    "terminal.external.osxExec": "iTerm.app",
    "editor.renderWhitespace": "boundary",
    "ruby.intellisense": "rubyLocate",
    "workbench.editorAssociations": {
        "*.ipynb": "jupyter.notebook.ipynb"
    },
    "diffEditor.ignoreTrimWhitespace": false,
    "editor.minimap.enabled": false,
    "files.insertFinalNewline": true,
    "diffEditor.maxComputationTime": 0,
    "files.trimTrailingWhitespace": true
}
```
