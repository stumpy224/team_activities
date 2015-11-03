class Member < ActiveRecord::Base
  validates_presence_of :identifier, :name
  has_many :votes
  
  def active?
    !!@active
  end

  def self.get_member_by_identifier(acid)
    @member = Member.where(identifier: acid.upcase, active: true)
  end
end
