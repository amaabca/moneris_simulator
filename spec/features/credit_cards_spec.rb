describe "CreditCard" do
  before(:each) do
    visit moneris_simulator.new_credit_card_path
  end

  it "renders a credit card input" do
    expect(page).to have_css "input.monerisInput#monerisDataInput"
  end
end
