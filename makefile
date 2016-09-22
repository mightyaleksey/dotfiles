.PHONY: debug npm repo update upgrade upgrade-st upgrade-zsh

debug:
	@echo hello, wanderer!

npm:
	@cp -nv npm-package/.[^.]* $(origin)/ 2>/dev/null || :
	@cp -nrv npm-package/{lib,test} $(origin)/ 2>/dev/null || :
	@tool/pipe.sh npm-package/package.json $(origin)

repo:
	open https://github.com/sullenor/dotfiles

update:
	git pull --rebase

upgrade-st:
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
	cp -r sublime\ text/Packages/JavaScript/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript/
	cp -r sublime\ text/Packages/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

upgrade-zsh:
	cp -r oh-my-zsh/custom/plugins/* ~/.oh-my-zsh/custom/plugins/

upgrade: upgrade-st upgrade-zsh
