echo "Follow the current theme mode in KDE icons and Kdenlive colors"

# The Kdenlive styling migration only seeded dark defaults. Now that theme
# switches keep KDE in sync through omarchy-theme-set-kde, apply the current
# theme's mode once so light-theme users are not stuck dark until their next
# theme switch. The command only touches Omarchy-managed values.
omarchy-theme-set-kde || true
