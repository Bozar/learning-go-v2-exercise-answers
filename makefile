FILE_SRC := 4_3.go

FILE_EXEC := prog
FILE_EXEC_WIN := prog.exe
FILE_GIT_KEEP := .gitkeep
FILE_GIT_IGNORE := .gitignore
FILE_TAG := tags

DIR_BUILD := ./build
DIR_SRC := ./src
DIR_SHARE := ~/share

PATH_SRC := $(addprefix $(DIR_SRC)/,$(FILE_SRC))
PATH_EXEC := $(addprefix $(DIR_BUILD)/,$(FILE_EXEC))
PATH_EXEC_WIN := $(addprefix $(DIR_SHARE)/,$(FILE_EXEC_WIN))
PATH_TAG := ./$(FILE_TAG)

CMD_FMT := go fmt
CMD_CHECK_1 := go vet
CMD_CHECK_2 := go-staticcheck
CMD_BUILD := go build

ARG_WIN := GOOS=windows GOARCH=amd64


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


.PHONY: win
win: $(PATH_SRC)
	$(ARG_WIN) $(CMD_BUILD) -o $(PATH_EXEC_WIN) $^
