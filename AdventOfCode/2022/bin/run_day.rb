#!/usr/bin/env ruby
# frozen_string_literal: true

RED = "\e[31m"
GREEN = "\e[32m"
YELLOW = "\e[33m"
NC = "\e[0m"

year = ARGV[0].to_i
day = ARGV[1].to_i
part_2 = ARGV[2]

$LOAD_PATH << File.join(__dir__, "../lib")

Dir[File.join(__dir__, "../lib/**/*.rb")]
  .grep(/day_#{"%02d" % day}/)
  .each(&method(:require))

day_class_name = Object.constants.grep(/Day#{"%02d" % day}/).first
day_class = Object.const_get(day_class_name).new
filename = "inputs/#{year}_#{day}_input.txt"

answer = part_2 ?
  day_class.perform_pII(filename) :
  day_class.perform(filename)

puts "#{GREEN}Day %02d %s#{NC}" % [day, part_2 ? "pI" : "pII"]
puts "\t#{YELLOW}Answer: #{NC}#{answer}"
