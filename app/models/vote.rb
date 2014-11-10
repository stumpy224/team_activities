class Vote < ActiveRecord::Base
  validates_presence_of :member_id, :nomination_id, :points
end
