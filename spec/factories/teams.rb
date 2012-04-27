FactoryGirl.define do
  factory :team do |f|
    f.sequence (:name){Factory.next(:name)}
    description 'this is a description lorem impsum'
  end
end