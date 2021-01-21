require_relative '../lib/dark_trader.rb'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   

describe "array_crypto" do
  it "no erreur & no nil and retrieves the price of all cryptocurrencies" do
      expect(array_crypto(page)).not_to be_empty 
  end
end

describe "name_crypto" do
  it "should retrieves all the crypto symbols" do
    expect(name_crypto(page)).not_to be_empty 
  end
end

describe "value_crypto" do
  it "should retrieves all the crypto symbols" do
    expect(value_crypto(page)).not_to be_empty 
  end
end