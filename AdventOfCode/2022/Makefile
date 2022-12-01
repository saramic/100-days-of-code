.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: puzzle-input
puzzle-input:
	curl "https://adventofcode.com/$(year)/day/$(day)/input" \
  	-H "cookie: session=${SESSION}" > inputs/$(year)_$(day)_input.txt

.PHONY: build
build:
	bundle exec rspec

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: day01 day01pII
day01:
	bundle exec ruby -I lib -e "require 'day_01_calorie_counter'; puts Day01CalorieCounter.new.perform(ARGV[0])" inputs/2022_1_input.txt
day01pII:
	bundle exec ruby -I lib -e "require 'day_01_calorie_counter'; puts Day01CalorieCounter.new.perform_pII(ARGV[0])" inputs/2022_1_input.txt

.PHONY: all
all: day01 day01pII

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make${NC}                               show this usage menu"
	@echo
	@echo "${YELLOW}make puzzle-input year=2021 day=1${NC}  using ENV SESSION"
	@echo
	@echo "${YELLOW}make build${NC}                         run build rspec"
	@echo "${YELLOW}make rubocop${NC}                       rubocop everything"
	@echo "${YELLOW}make rubocop-fix${NC}                   rubocop fix everything"
	@echo
	@echo "${YELLOW}make all${NC}                           run all the solutions"
	@echo