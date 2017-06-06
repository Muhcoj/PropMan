FactoryGirl.define do
  factory :finance do
    year "2017"
    month "January"
    payment_due 40.50
    #gas 12345,63
    #water 65432,13
    #electricity 12345,73
    user
  end

  factory :second_finance, class: "Finance" do
    year "2016"
    month "February"
    payment_due 48.50
    # gas 65432,1
    # water 12345,7
    # electricity 12345,6
    # 
    user
  end

  factory :finance_from_other_user, class: "Finance" do
    year "2016"
    month "February"
    payment_due 48.50
    # gas 65432,1
    # water 12345,7
    # electricity 12345,6
    # 
    non_authorized_user
  end
end