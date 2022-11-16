# ディスプレイをスリープするまでの時間を 10 分に変更（バッテリー時）
sudo pmset -b displaysleep 10
# ディスプレイをスリープするまでの時間を 30 分に変更（充電時）
sudo pmset -c displaysleep 30

# キーリピートの高速化
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# マウス速度を速く
defaults write -g com.apple.mouse.scaling 3
# トラックパッド速度を速く
defaults write -g com.apple.trackpad.scaling 5
# タップでクリック
defaults write -g com.apple.mouse.tapBehavior -int 1
# Dock を自動で隠す
defaults write com.apple.dock autohide -bool true
# 隠しファイルを Finder に表示
defaults write com.apple.finder AppleShowAllFiles YES
# Finder に拡張子を表示
defaults write -g AppleShowAllExtensions -bool true
# タイトルにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# バッテリー残量の % を表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# ネットワークストレージに .DS_store を作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# スクリーンショットの保存先を指定
mkdir "${HOME}/Desktop/screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"

# Windows 風キー操作に変更
defaults write com.apple.inputmethod.Kotoeri JIMPrefShiftKeyActionKey -boolean true
# ライブ変換無効
defaults write com.apple.inputmethod.Kotoeri JIMPrefLiveConversionKey 0

# 設定を反映するために Dock と Finder を kill
killall Finder
killall Dock
