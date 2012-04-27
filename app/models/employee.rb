class Employee < ActiveRecord::Base

  validates_presence_of :name, :mobile_number, :landline_number, :twitter_username, :email
  validates :facebook_url, :url => { :allow_blank => true }
  validates :twitter_url, :url => { :allow_blank => true }
  validates :email, :email => { :allow_blank => false }
  attr_accessible :name, :email, :mobile_number, :landline_number, :twitter_url, :facebook_url, :twitter_username, :employee_teams_attributes
  

  has_many :employee_teams, :class_name => 'TeamEmployee', :foreign_key => 'employee_id', :dependent => :destroy
  has_many :teams, :through => :employee_teams

  accepts_nested_attributes_for :employee_teams
end
