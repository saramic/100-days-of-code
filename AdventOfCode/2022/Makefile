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

.PHONY: day01 day01pII day02 day02pII day03 day03II
day01:
	bin/run_day.rb 2022 1
day01pII:
	bin/run_day.rb 2022 1 true
day02:
	bin/run_day.rb 2022 2
day02pII:
	bin/run_day.rb 2022 2 true
day03:
	bin/run_day.rb 2022 3
day03pII:
	bin/run_day.rb 2022 3 true

.PHONY: all
all: day01 day01pII day02 day02pII day03 day03pII

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
	@echo "${YELLOW}make day02${NC}                         run solution for day 02"
	@echo "${YELLOW}make day02pII${NC}                      run solution for day 02 part II"
	@echo