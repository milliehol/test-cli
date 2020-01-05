class Test::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.filmsite.org/bestactor2.html"))
  end

  def self.create_actor
    
     new_page = Nokogiri::HTML(open("https://www.filmsite.org/bestactor2.html"))
    
     new_page.css("div#mainBodyWrapper").each do |actor|
       year = actor.css("table tr td:nth-child(1)").text.strip
       name = actor.css("table tr td:nth-child(2)").text.strip
       role = actor.css("table tr td:nth-child(3)").text.strip
       Test::Actor.new(year, name, role)
       end
  end

  #def create_actor
    #scrape_actor.each do |r|
      #Test::Actor.new(r)
    #end
  #end
end
