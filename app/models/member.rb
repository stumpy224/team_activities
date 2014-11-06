class Member < ActiveRecord::Base
  validates_presence_of :identifier, :name, :active
  has_many :votes
  
  def active?
    !!@active
  end
end
