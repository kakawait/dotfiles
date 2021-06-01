# Gtk
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc" 

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
# nvm
export NVM_DIR="${XDG_DATA_HOME}/nvm"

# Docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
# Docker rootless
export DOCKER_HOST="unix://${XDG_RUNTIME_DIR}/docker.sock"

# Rust
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

# Gradle
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle" 