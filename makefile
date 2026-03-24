FILE_SRC := 2_1.go

FILE_EXEC := prog
FILE_GIT_KEEP := .gitkeep
FILE_GIT_IGNORE := .gitignore
FILE_TAG := tags

DIR_BUILD := ./build
DIR_SRC := ./src

PATH_SRC := $(addprefix $(DIR_SRC)/,$(FILE_SRC))
PATH_EXEC := $(addprefix $(DIR_BUILD)/,$(FILE_EXEC))
PATH_TAG := ./$(FILE_TAG)

CMD_FMT := go fmt
CMD_CHECK_1 := go vet
CMD_CHECK_2 := go-staticcheck
CMD_BUILD := go build


$(PATH_EXEC): $(PATH_SRC)
	$(CMD_FMT) $^
	$(CMD_CHECK_1) $^
	$(CMD_CHECK_2) $^
	$(CMD_BUILD) -o $@ $^
	$(MAKE) $(PATH_TAG)


$(PATH_TAG): $(PATH_SRC)
	ctags --tag-relative=never -R .


.PHONY: init
init:
	mkdir -p $(DIR_BUILD)
	mkdir -p $(DIR_SRC)
	touch $(DIR_BUILD)/$(FILE_GIT_KEEP)
	touch $(FILE_GIT_IGNORE)
	git init


.PHONY: run
run:
	$(DIR_BUILD)/$(FILE_EXEC)


.PHONY: clean
clean:
	rm -rIv $(PATH_EXEC)
