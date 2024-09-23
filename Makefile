NAME := kdl2_practice

BUILD_DIR := build

KDL2_ROM := Kirby's Dream Land 2 (USA, Europe) (SGB Enhanced).gb
KDL2_SAVESTATES_BSDIFF := Kirby's Dream Land 2 (U) [S][!].gb.bsdiff

SOURCE_FILE := $(NAME).asm

OBJECT_FILE := $(BUILD_DIR)/$(NAME).o

OUTPUT_ROM := patched.gb

SYM_ROM := $(BUILD_DIR)/$(NAME).sym

TMP_ROM := $(BUILD_DIR)/$(NAME)_temp.gb

.PHONY: dirs
dirs:
	mkdir -p $(BUILD_DIR)

.PHONY: execute
execute: dirs
	cp "$(KDL2_ROM)" "$(TMP_ROM)"
	rgbasm -E $(SOURCE_FILE) -o $(OBJECT_FILE)
	rgblink -n $(SYM_ROM) -O $(TMP_ROM) -o $(OUTPUT_ROM) $(OBJECT_FILE)
	rgbfix -p 0 -f gh $(OUTPUT_ROM)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(OUTPUT_ROM)

# bspatch "$(KDL2_ROM)" "$(TMP_ROM)" "$(KDL2_SAVESTATES_BSDIFF)" || 