require 'rails_helper'

RSpec.describe "kontoumsatzs/edit", type: :view do
  before(:each) do
    @kontoumsatz = assign(:kontoumsatz, Kontoumsatz.create!(
      :weg => 1,
      :wertstellung => "MyString",
      :umsatzart => "MyString",
      :buchungsdetails => "MyString",
      :auftraggeber => "MyString",
      :empfaenger => "MyString",
      :betrag => "9.99",
      :saldo => "9.99"
    ))
  end

  it "renders the edit kontoumsatz form" do
    render

    assert_select "form[action=?][method=?]", kontoumsatz_path(@kontoumsatz), "post" do

      assert_select "input#kontoumsatz_weg[name=?]", "kontoumsatz[weg]"

      assert_select "input#kontoumsatz_wertstellung[name=?]", "kontoumsatz[wertstellung]"

      assert_select "input#kontoumsatz_umsatzart[name=?]", "kontoumsatz[umsatzart]"

      assert_select "input#kontoumsatz_buchungsdetails[name=?]", "kontoumsatz[buchungsdetails]"

      assert_select "input#kontoumsatz_auftraggeber[name=?]", "kontoumsatz[auftraggeber]"

      assert_select "input#kontoumsatz_empfaenger[name=?]", "kontoumsatz[empfaenger]"

      assert_select "input#kontoumsatz_betrag[name=?]", "kontoumsatz[betrag]"

      assert_select "input#kontoumsatz_saldo[name=?]", "kontoumsatz[saldo]"
    end
  end
end
