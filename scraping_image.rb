require 'mechanize'

agent = Mechanize.new
page = agent.get("http://review-movie.herokuapp.com/")

elements = page.search('img.mini-post-image')

elements.each do |ele|
  puts ele.get_attribute('src')
end
