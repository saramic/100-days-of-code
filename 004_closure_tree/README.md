# Day 004 closure tree

demo the closure tree gem - https://github.com/ClosureTree/closure_tree

## TL;DR

```bash
bundle
rake db:create db:migrate
bundle exec rspec

bundle exec rubocop
```

also

```bash
rake -T

rake db:new_migration name="create_companies"

rake db:create db:migrate

RAILS_ENV=test rake db:drop db:create db:migrate
```

## Closure Tree Migration Generation

the following threw errors, is it possible to call a generator without Rails?

```
bundle exec ruby -e 'require "bundler/setup"; \
  Bundler.require(:default); \
  Rails::Generators.invoke("closure_tree:migration", \
    destination_root: Pathname.new(`pwd`.chomp))' \
    company
```
