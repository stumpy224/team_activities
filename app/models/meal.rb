class Meal < ActiveRecord::Base
  def self.get_count_in_favor_of_lunch
    @count = Meal.where(dinner_indicator: false).count
  end

  def self.get_count_in_favor_of_dinner
    @count = Meal.where(dinner_indicator: true).count
  end

  def is_dinner_preferred?
    !!@dinner_indicator
  end
end
