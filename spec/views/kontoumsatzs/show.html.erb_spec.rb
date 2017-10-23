require 'rails_helper'

RSpec.describe "kontoumsatzs/show", type: :view do
  before(:each) do
    @kontoumsatz = assign(:kontoumsatz, Kontoumsatz.create!(
      :weg => 2,
      :wertstellung => "Wertstellung",
      :umsatzart => "Umsatzart",
      :buchungsdetails => "Buchungsdetails",
      :auftraggeber => "Auftraggeber",
      :empfaenger => "Empfaenger",
      :betrag => "9.99",
      :saldo => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Wertstellung/)
    expect(rendered).to match(/Umsatzart/)
    expect(rendered).to match(/Buchungsdetails/)
    expect(rendered).to match(/Auftraggeber/)
    expect(rendered).to match(/Empfaenger/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
