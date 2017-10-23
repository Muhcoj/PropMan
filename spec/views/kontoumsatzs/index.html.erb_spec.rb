require 'rails_helper'

RSpec.describe "kontoumsatzs/index", type: :view do
  before(:each) do
    assign(:kontoumsatzs, [
      Kontoumsatz.create!(
        :weg => 2,
        :wertstellung => "Wertstellung",
        :umsatzart => "Umsatzart",
        :buchungsdetails => "Buchungsdetails",
        :auftraggeber => "Auftraggeber",
        :empfaenger => "Empfaenger",
        :betrag => "9.99",
        :saldo => "9.99"
      ),
      Kontoumsatz.create!(
        :weg => 2,
        :wertstellung => "Wertstellung",
        :umsatzart => "Umsatzart",
        :buchungsdetails => "Buchungsdetails",
        :auftraggeber => "Auftraggeber",
        :empfaenger => "Empfaenger",
        :betrag => "9.99",
        :saldo => "9.99"
      )
    ])
  end

  it "renders a list of kontoumsatzs" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Wertstellung".to_s, :count => 2
    assert_select "tr>td", :text => "Umsatzart".to_s, :count => 2
    assert_select "tr>td", :text => "Buchungsdetails".to_s, :count => 2
    assert_select "tr>td", :text => "Auftraggeber".to_s, :count => 2
    assert_select "tr>td", :text => "Empfaenger".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
