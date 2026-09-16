SHELL := /bin/bash

.PHONY: get clean test analyze

R='\033[0;31m'
G='\033[0;32m'
Y='\033[1;32m'
B='\033[0;34m'
NOCOLOR='\033[0m'

PUBSPEC_FILES := $(shell find . -name 'pubspec.yaml' -not -path '*/.dart_tool/*')

get:
	@for file in $(PUBSPEC_FILES); do \
	   dir=$${file%pubspec.yaml}; \
	   echo "Processing $$file"; \
	   ( cd "$$dir" && flutter pub get ) || \
	      { echo "${R}flutter pub get failed in $$dir${NOCOLOR}"; exit 1; }; \
	done
	@echo "${G}Flutter pub get completed successfully${NOCOLOR}"

gen:
	@for file in $(PUBSPEC_FILES); do \
	   dir=$${file%pubspec.yaml}; \
	   echo "Processing $$file"; \
	   ( cd "$$dir" && dart run build_runner build --delete-conflicting-outputs ) || \
	      { echo "${R}build_runner failed in $$dir${NOCOLOR}"; exit 1; }; \
	done
	@echo "${G}Build runner completed successfully${NOCOLOR}"

clean:
	@for file in $(PUBSPEC_FILES); do \
	   dir=$${file%pubspec.yaml}; \
	   ( cd "$$dir" && pwd && flutter clean ) || \
	      { echo "${R}flutter clean failed in $$dir${NOCOLOR}"; exit 1; }; \
	done
	@echo "${G}Flutter clean completed successfully${NOCOLOR}"

test:
	@for file in $(PUBSPEC_FILES); do \
	   dir=$${file%pubspec.yaml}; \
	   ( cd "$$dir" && pwd && flutter test --no-pub --coverage ) || \
	      { echo "${R}Tests failed in $$dir${NOCOLOR}"; exit 1; }; \
	done
	@echo "${G}Tests have passed successfully${NOCOLOR}"

analyze:
	@for file in $(PUBSPEC_FILES); do \
	   dir=$${file%pubspec.yaml}; \
	   ( cd "$$dir" && pwd && dart analyze . --fatal-infos ) || \
	      { echo "${R}Analyze failed in $$dir${NOCOLOR}"; exit 1; }; \
	done
	@echo "${G}Analyze passed successfully${NOCOLOR}"