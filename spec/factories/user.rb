FactoryGirl.define do 
  factory :user do 
    first_name 'John'
    last_name 'Smith'
    email 'jsmith@googlemail.com'
    password 'testpassword'
  end
end