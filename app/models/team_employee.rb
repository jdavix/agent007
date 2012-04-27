class TeamEmployee < ActiveRecord::Base
  validates_uniqueness_of :team_id, :scope => :employee_id
  belongs_to :employee
  belongs_to :team
end
