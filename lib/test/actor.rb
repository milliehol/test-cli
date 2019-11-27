class Test::Actor

  attr_accessor :year, :name, :movie

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("div#mainBodyWrapper table tr td:nth-child(1)").text,
      r.css("div#mainBodyWrapper table tr td:nth-child(2)").text,
      r.css("div#mainBodyWrapper table tr td:nth-child(3)").text
      )
  end

  def initialize(year, name, movie=nil)
    @year = year
    @name = name
    @movie = movie
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  #def best_dish
    #@best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
    # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  #end

  #def food_style
    #@food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
    # @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  #end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
