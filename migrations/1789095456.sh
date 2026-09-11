echo "Style Kdenlive with Breeze and use Breeze-dark KDE icons"

omarchy-pkg-add breeze

kdeglobals=$HOME/.config/kdeglobals
icons_theme_set=0
if [[ -f $kdeglobals ]]; then
  icons_theme_set=$(awk '/^\[/ { section=$0; next } section == "[Icons]" && /^[[:space:]]*Theme[[:space:]]*=/ { found=1 } END { print found+0 }' "$kdeglobals")
fi

if (( icons_theme_set )); then
  : keep the icon theme the user already chose
elif [[ -f $kdeglobals ]] && grep -q '^\[Icons\]' "$kdeglobals"; then
  sed -i '/^\[Icons\]/a Theme=breeze-dark' "$kdeglobals"
elif [[ -f $kdeglobals ]]; then
  printf '\n[Icons]\nTheme=breeze-dark\n' >>"$kdeglobals"
else
  mkdir -p "${kdeglobals%/*}"
  cp "$OMARCHY_PATH/config/kdeglobals" "$kdeglobals"
fi

launcher=$HOME/.local/share/applications/org.kde.kdenlive.desktop
if [[ ! -e $launcher ]]; then
  mkdir -p "${launcher%/*}"
  cp "$OMARCHY_PATH/applications/org.kde.kdenlive.desktop" "$launcher"
fi
