CC = pdflatex

BUILD_PATH = build
BIN = ruben_sorensen_cv
SRC_PATH = src
MAIN_FILE = main.tex

.PHONY : default_target
default_target : all

.PHONY : clean
clean :
	@echo "Deleting $(BIN_FILE) symlink"
	@$(RM) $(BIN)
	@echo "Deleting build directory"
	@$(RM) -r $(BUILD_PATH)

.PHONY : all
all : $(BUILD_PATH)/$(BIN)
	@echo "Creating symlink: $(BIN) -> $<"
	@$(RM) $(BIN)
	@ln -s $(BUILD_PATH)/$(BIN).pdf $(BIN)

$(BUILD_PATH)/$(BIN) : dir
	$(CC) -output-directory=$(BUILD_PATH) -jobname=$(BIN) $(SRC_PATH)/$(MAIN_FILE)

.PHONY : dir
dir :
	@echo "Creating build directory"
	@mkdir -p $(BUILD_PATH)
