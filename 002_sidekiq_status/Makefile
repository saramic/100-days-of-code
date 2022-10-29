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

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make${NC}              show this usage menu"
	@echo "${YELLOW}make setup${NC}        setup .session.key"
	@echo "${YELLOW}make sidekiq-web${NC}  run sidekiq-web"
	@echo
