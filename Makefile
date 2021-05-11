TARGET := videoeditor

ODIR := obj
SDIR := src
IDIR := include
OUTDIR := dist
DEPDIR := deps

INCLUDES := $(shell find $(IDIR)/ -name "*.hpp")

LIBS := m
CC := g++
CFLAGS := -O2 $(DEPFLAGS) -Wall -Wextra -Wformat -pedantic -iquote$(IDIR) -l$(LIBS) $(shell pkg-config --cflags --libs gtkmm-3.0 | sed s/-I/-isystem/g)

SOURCE_FILES := $(shell find $(SDIR)/ -name *.cpp)
OBJECT_FILES := $(patsubst $(SDIR)/%.cpp, $(ODIR)/%.o, $(SOURCE_FILES))
DEPFILES := $(patsubst $(SDIR)/%.cpp, $(DEPDIR)/%.d, $(SOURCE_FILES))

$(DEPFILES):

-include $(wildcard $(DEPFILES))

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEPDIR)/%.d | $(ODIR) $(DEPDIR)
	$(CC) $(CFLAGS) $< -c -o $@ -MMD -MT $@ -MP -MF $(patsubst $(SDIR)/%.cpp, $(DEPDIR)/%.d, $<)

$(ODIR):
	mkdir -p $@
$(OUTDIR):
	mkdir -p $@
$(DEPDIR):
	mkdir -p $@

.PHONY: build
build: $(OBJECT_FILES) | $(OUTDIR)
	$(CC) $(CFLAGS) $(OBJECT_FILES) -o $(OUTDIR)/$(TARGET)

.PHONY: clean
clean:
	@rm -rf $(ODIR)
	@rm -rf $(DEPDIR)

.DEFAULT_GOAL := build
