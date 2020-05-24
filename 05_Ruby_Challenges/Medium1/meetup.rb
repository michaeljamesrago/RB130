# Meetup class is intialized with two arguments, a month and a year
# method Meetup#day takes two arguments
#   a weekday (:monday, :tuesday, etc)
#   a schedule, one of [:first, :second, :third, :fourth, :last, :teenth]
# and returns a Date object
require 'date'
class Meetup
  WEEKDAYS = { sunday: 0,
               monday: 1,
               tuesday: 2,
               wednesday: 3,
               thursday: 4,
               friday: 5,
               saturday: 6 }
  ORDINALS = { first: 0,
               second: 1,
               third: 2,
               fourth: 3 }
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    x = days.select { |day| day.wday == WEEKDAYS[weekday] }
    if ORDINALS.keys.include?(schedule)
      x[ORDINALS[schedule]]
    elsif schedule == :last
      x[-1]
    elsif schedule == :teenth
      x.find { |date| (13..19).cover?(date.day) }
    end
  end

  def days
    days = []
    begin
      (1..31).each do |day|
        days << Date.new(@year, @month, day)
      end
    rescue Date::Error
      return days
    end
    days
  end
end
