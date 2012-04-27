require 'spec_helper'

describe Employee do
  describe "Model validators" do
    before do
        Factory(:employee)
    end
    it{should validate_presence_of :name}
    it{should validate_presence_of :mobile_number}
    it{should validate_presence_of :landline_number}
    it{should validate_presence_of :twitter_username}
    it{should validate_presence_of :email}
    it{should have_many :employee_teams}
    it{should have_many :teams}
  end
end