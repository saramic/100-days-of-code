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
	@echo "${YELLOW}Day 01${GREEN}"
	bundle exec ruby -I lib -e "require 'day_01_calorie_counter';\
		puts Day01CalorieCounter.new.perform(ARGV[0])" \
		inputs/2022_1_input.txt
	@echo "${NC}"
day01pII:
	@echo "${YELLOW}Day 01 pII${GREEN}"
	bundle exec ruby -I lib -e "require 'day_01_calorie_counter'; \
		puts Day01CalorieCounter.new.perform_pII(ARGV[0])" \
		inputs/2022_1_input.txt
	@echo "${NC}"
day02:
	@echo "${YELLOW}Day 02${GREEN}"
	bundle exec ruby -I lib -e "require 'day_02_rock_paper_scissors'; \
		puts Day02RockPaperScissors.new.perform(ARGV[0])" \
		inputs/2022_2_input.txt
	@echo "${NC}"
day02pII:
	@echo "${YELLOW}Day 02${GREEN}"
	bundle exec ruby -I lib -e "require 'day_02_rock_paper_scissors'; \
		puts Day02RockPaperScissors.new.perform_pII(ARGV[0])" \
		inputs/2022_2_input.txt
	@echo "${NC}"
day03:
	@echo "${YELLOW}Day 03${GREEN}"
	bundle exec ruby -I lib -e "require 'day_03_rucksack_reorg'; \
		puts Day03RucksackReorg.new.perform(ARGV[0])" \
		inputs/2022_3_input.txt
	@echo "${NC}"
day03pII:
	@echo "${YELLOW}Day 03 part II${GREEN}"
	bundle exec ruby -I lib -e "require 'day_03_rucksack_reorg'; \
		puts Day03RucksackReorg.new.perform_pII(ARGV[0])" \
		inputs/2022_3_input.txt
	@echo "${NC}"

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