class Test::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.filmsite.org/bestactor2.html"))
  end

  def self.create_actor
    
     self.get_page.css("div#t1-50 li").each do |actor|
       
       
       
      Test::Actor.new(r)
       
     end
  end

  #def create_actor
    #scrape_actor.each do |r|
      #Test::Actor.new(r)
    #end
  #end
end
