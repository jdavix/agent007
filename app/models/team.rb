class Team < ActiveRecord::Base
  validates_presence_of :name

  attr_accessible :name, :description

  has_many :team_employees, :dependent => :destroy
  has_many :employees, :through => :team_employees
  #accepts_nested_attributes_for :employees
end
