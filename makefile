# Информация о пользователе
name = Alexis Litvinov
email = iamhoneyboy@gmail.com

# Пути
pwd = $(shell pwd)
home = test/
links = $(pwd)/linkedId/

# Конфиги
git = .gitconfig

# Функции
copy = sed -e 's/\#{user}/$(name)/' -e 's/\#{email}/$(email)/' $(1) > $(links)$(1)
link = ln -sv $(links)$(1) $(home)$(1)

$(home):
	mkdir -p $(home)

$(links):
	mkdir -p $(links)

$(links)$(git): $(links) $(git)
	@$(call copy,$(git))

$(home)$(git): $(home) $(links)$(git)
	@$(call link,$(git))

install: $(home)$(git)
