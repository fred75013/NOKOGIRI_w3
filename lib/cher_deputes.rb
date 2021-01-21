require 'nokogiri'
require 'open-uri'

list = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))

def deputes_url(list)
  array_url = []
  urls = list.search('//a[contains(@href, "/deputes/fiche/")]')
  urls.each do |url|
    array_url << "http://www2.assemblee-nationale.fr/#{url['href']}"
  end
  return array_url
end

def deputes_first_name(list)
  first_name = []
  names = list.search('//a[contains(@href, "/deputes/fiche/")]')
  names.each do |name|
    first_name << name.text.split[1]
  end
  return first_name
end

#ah partir d'ici je me suis fait bannir du site des députés :(