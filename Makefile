CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .Makefile.swp
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
BIN_DIR = ./bin

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install:
	cp ./bin/* ~/
