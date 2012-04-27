FactoryGirl.define do
  Factory.sequence :name do |i|
    "This is a name #{i}"
  end
  factory :employee do |f|
    f.sequence (:name){Factory.next(:name)}
    f.sequence (:email){Factory.next(:email)}
    mobile_number '123-2323-2323'
    landline_number '434-3434-3439'
    twitter_username 'mytwitter'
  end
end