require_relative '../lib/cher_deputes_spec.rb'

list = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))