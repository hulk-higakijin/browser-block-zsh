# Block installing browser packages through the Homebrew command used in this shell.

typeset -ga BROWSER_BLOCKED_PACKAGES
BROWSER_BLOCKED_PACKAGES=(
  arc
  brave-browser
  chromium
  duckduckgo
  firefox
  google-chrome
  microsoft-edge
  opera
  orion
  tor-browser
  ungoogled-chromium
  vivaldi
  zen-browser
)

brew() {
  local subcommand=""
  local argument package_name
  local blocked=0

  for argument in "$@"; do
    if [[ -z "$subcommand" && "$argument" != -* ]]; then
      subcommand="$argument"
      continue
    fi

    if [[ "$subcommand" == "cask" && "$argument" == "install" ]]; then
      subcommand="install"
      continue
    fi

    if [[ "$subcommand" == "install" ]]; then
      for package_name in "${BROWSER_BLOCKED_PACKAGES[@]}"; do
        if [[ "$argument" == "$package_name" ]]; then
          blocked=1
          break 2
        fi
      done
    fi
  done

  if (( blocked )); then
    printf 'Blocked: installing browser package "%s" through Homebrew is disabled.\n' "$argument" >&2
    return 1
  fi

  command brew "$@"
}
