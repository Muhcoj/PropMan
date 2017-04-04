FactoryGirl.define do
  factory :finance do
    year "2017"
    month "January"
    payment_due 40.50
    user
  end

  factory :second_finance, class: "Finance" do
    year "2016"
    month "February"
    payment_due 48.50
    user
  end
end