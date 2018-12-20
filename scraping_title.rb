require 'mechanize'

agent = Mechanize.new
pagen1 = "http://review-movie.herokuapp.com"
page = agent.get(pagen1)

elements = page.search('h2.entry-title a')

elements.each do |ele|
  puts ele.inner_text  
end
