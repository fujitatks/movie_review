require 'mechanize'

agent = Mechanize.new
pagen1 = "http://review-movie.herokuapp.com"
page = agent.get(pagen1)

elements = page.search('h2.entry-title a')

elements.each do |ele|
  pagen2 = ele.get_attribute('href')
  # p pagen1+pagen2
  page2 = agent.get(pagen1+pagen2)
  
  elements2 = page2.search('img.post-image')
  # p elements2
  # puts elements2.get_attribute('src')
  elements2.each do |ele2|
    # puts ele2    
    puts ele2.get_attribute('src')
  end
end
