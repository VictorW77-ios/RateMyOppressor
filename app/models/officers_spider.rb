require 'kimurai'
require 'nokogiri'
require 'open-uri'

class OfficersSpider < Kimurai::Base 
    @name = 'officers_spider'
    @engine = :mechanize

    def self.get_doc 
        Nokogiri::HTML(open("https://openoversight.com/department/1"))
    end 

    def self.officer_list
        self.get_doc.css(".list-group-item")
    end 

    def self.parse_officers(response, url:, data: {})
        self.officer_list.each do |officer|
    
            item[:name] = officer.css("h2 a").map {|n| n.text.strip.tr("\n", " ") }
            item[:race] = officer.css("div:first-child > dl > dd:last-child").map { |r| r.text.strip.split(/([[:upper:]][[:lower:]]*)/).join("") }
            item[:job_title] = officer.css("div:first-child > dl > dd[2]").map { |jt| jt.text.strip.split(/([[:upper:]][[:lower:]]*)/).join("") }
            item[:gender] = officer.css("div:last-child > dl > dd").map { |g| g.text.delete("0" + "1") }.reject(&:empty?)
            item[:badge_number] = officer.css("h2 small").map {|bn| bn.text.strip}
            
            Officer.where(item).first_or_create
        end
        render :index
    end 
end 