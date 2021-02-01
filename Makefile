install: install_homebrew install_chezmoi

install_homebrew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

install_chezmoi:
	brew install chezmoi