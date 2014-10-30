class Member < ActiveRecord::Base
  validates_presence_of :identifier, :name, :active
  
  def active?
    !!@active
  end
end
