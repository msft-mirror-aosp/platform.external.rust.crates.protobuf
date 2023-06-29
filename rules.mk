# This file is generated by cargo2rulesmk.py --run --config cargo2rulesmk.json --features .
# Do not modify this file as changes will be overridden on upgrade.

LOCAL_DIR := $(GET_LOCAL_DIR)
MODULE := $(LOCAL_DIR)
MODULE_CRATE_NAME := protobuf
MODULE_SRCS := \
	$(LOCAL_DIR)/src/lib.rs \

OUT_FILE := $(call TOBUILDDIR,$(MODULE))/version.rs
$(OUT_FILE): $(MODULE)/out/version.rs
	@echo copying $< to $@
	@$(MKDIR)
	cp $< $@

MODULE_RUST_ENV += OUT_DIR=$(dir $(OUT_FILE))

MODULE_SRCDEPS := $(OUT_FILE)
MODULE_RUST_EDITION := 2018
MODULE_LIBRARY_DEPS := \
	external/rust/crates/serde \
	external/rust/crates/serde_derive \

include make/library.mk
