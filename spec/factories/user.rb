FactoryGirl.define do 
  factory :user do 
    first_name 'John'
    last_name 'Smith'
    email 'jsmith@googlemail.com'
    password_digest '9x29x'
  end
end