require 'nokogiri' 
require 'open-uri'

valdoise = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html")) 


def get_townhall_urls(valdoise)
    townhall_urls = []
    valdoise.search('.lientxt').map do |name|
       townhall_urls << "https://www.annuaire-des-mairies.com/95/#{name.text.downcase.tr(' ', '-')}.html"
    end
    return townhall_urls
end

def get_townhall_email(valdoise)
    array_emails = []
    get_townhall_urls(valdoise).map do |url|
    array_emails << Nokogiri::HTML(URI.open(url)).search('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
    end
    return array_emails
end

def get_townhall_name(valdoise)
    names = %W[]
    valdoise.search('.lientxt').map { |name| names << name.text.downcase.split.map(&:capitalize).join(' ')}
    return names
end

def valdoise_array(valdoise)
    hash_names_emails = get_townhall_name(valdoise).zip(get_townhall_email(valdoise)).map{|x| [x].to_h}
    puts hash_names_emails
end
valdoise_array(valdoise)

    
