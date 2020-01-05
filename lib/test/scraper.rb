class Test::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.filmsite.org/bestactor2.html"))
  end

  def self.create_actor
    
     self.get_page.css("div#t1-50 li").each do |actor|
       year = actor.css("div#mainBodyWrapper table tr td:nth-child(1)").text,
       name = actor.css("div#mainBodyWrapper table tr td:nth-child(2)").text,
       role = actor.css("div#mainBodyWrapper table tr td:nth-child(3)").text
       Test::Actor.new(year, name, role)
       end
  end

  #def create_actor
    #scrape_actor.each do |r|
      #Test::Actor.new(r)
    #end
  #end
end
