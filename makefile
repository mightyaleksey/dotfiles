.PHONY: sync update

sync:
	find ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User -name '*.sublime-snippet' \
	| xargs -I % cp % sublime\ text/Packages/User/
	find ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/JavaScript -name '*.sublime-snippet' \
	| xargs -I % cp % sublime\ text/Packages/JavaScript/

update-omz:
	cp -r oh-my-zsh/custom/plugins/* ~/.oh-my-zsh/custom/plugins/
