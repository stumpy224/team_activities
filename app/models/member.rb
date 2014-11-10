class Member < ActiveRecord::Base
  validates_presence_of :identifier, :name, :active
  has_many :votes
  
  def active?
    !!@active
  end

  def self.get_member_by_identifier(acid)
    @member = Member.find_by identifier: acid.upcase
  end
end
