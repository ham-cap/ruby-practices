#!/usr/bin/ruby
# frozen_string_literal: true

require 'date'
require 'optparse'

options = ARGV.getopts('m:y:')
year = options['y'] || Date.today.year
month = options['m'] || Date.today.month

puts "　　　　#{month}月　#{year}"
puts '日　月　火　水　木　金　土'
first_day = Date.parse("#{year}-#{month}-1")
final_day = Date.new(year.to_i, month.to_i, -1)
second_day = Date.parse("#{year}-#{month}-2")

days_array = []
if first_day.monday?
  spaces = ' ' * 5
  days_array.push("#{spaces}#{first_day.day}")
elsif first_day.tuesday?
  spaces = ' ' * 9
  days_array.push("#{spaces}#{first_day.day}")
elsif first_day.wednesday?
  spaces = ' ' * 13
  days_array.push("#{spaces}#{first_day.day}")
elsif first_day.thursday?
  spaces = ' ' * 17
  days_array.push("#{spaces}#{first_day.day}")
elsif first_day.friday?
  spaces = ' ' * 21
  days_array.push("#{spaces}#{first_day.day}")
elsif first_day.saturday?
  spaces = ' ' * 25
  days_array.push("#{spaces}#{first_day.day}\n")
else first_day.sunday?
  spaces = ' ' * 2
  days_array.push("#{first_day.day}#{spaces}")
end

days = (second_day..final_day)
days.each do |day|
  if day.saturday?
    days_array.push("#{day.day}\n")
  else
    days_array.push("#{day.day} ")
  end
end

days_array.each do |day|
  if day.to_i.positive? && day.to_i < 10
    print(" #{day} ")
  else
    print("#{day} ")
  end
end
