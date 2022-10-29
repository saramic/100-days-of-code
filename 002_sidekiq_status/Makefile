.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.session.key:
	ruby -e 'require "securerandom"; \
		File.open(".session.key", "w") {|f| \
		f.write(SecureRandom.hex(32)) }'

.PHONY: setup
setup: .session.key

.PHONY: sidekiq-web
sidekiq-web:
	bundle exec rackup sidekiq_web_config.ru

.PHONY: sidekiq
sidekiq:
	bundle exec sidekiq --require ./lib/jobs/long_steady_job.rb

.PHONY: demo
demo:
	echo $(duration) | \
	ruby -I lib -e 'require "jobs/long_steady_job"; \
	value = !$$stdin.eof && $$stdin.readline.to_i; \
	value.zero? ? \
		Jobs::LongSteadyJob.perform_async() : \
		Jobs::LongSteadyJob.perform_async(value)'

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make${NC}                   show this usage menu"
	@echo "${YELLOW}make setup${NC}             setup .session.key"
	@echo "${YELLOW}make sidekiq-web${NC}       run sidekiq-web"
	@echo "${YELLOW}make sidekiq${NC}           run sidekiq"
	@echo
	@echo "${YELLOW}make demo${NC}              run a long steady sidekiq job (60 secods)"
	@echo "${YELLOW}make demo duration=15${NC}  specify duration of long job in seconds (15 seconds)"
	@echo
