require 'nokogiri' 
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))  

def name_crypto(page)

    name_array = []
        page.search("/html/body/div/div/div/div/div/div/div/div/div/table/tbody/tr/td[3]/div").map do |name|
            name = name.text
            name_array << name
        end
    return name_array
    end

def value_crypto(page)

    value_array = []
        page.search(".price___3rj7O").map do |value|
            value = value.text
            value_array << value.tr('$', '')
        end
    return value_array
    end

def array_crypto(page)
    hash_crypto = name_crypto(page).zip(value_crypto(page)).map{|x| [x].to_h}
    return hash_crypto
end

array_crypto(page)