FactoryGirl.define do
  Factory.sequence :email do |i|
    "email_#{i}@example.com"
  end
  factory :admin_user do |f|
    f.sequence (:email){Factory.next(:email)}
    password "password"
    password_confirmation "password"
  end
end