require 'mechanize'

agent = Mechanize.new
# page = agent.get("https://app-mooovi.herokuapp.com/works/initial_scraping")
# elements = page.search('p')

# elements.each do |ele|
#   puts ele.inner_text
# end

#練習問題１
# page = agent.get("https://app-mooovi.herokuapp.com/works/first_scraping")
# elements = page.search('li')

# elements.each do |ele|
#   puts ele.inner_text
# end

#練習問題２
# page = agent.get("https://app-mooovi.herokuapp.com/works/second_scraping")
# elements = page.search('div div')

# elements.each do |ele|
#   puts ele.inner_text
# end

#練習問題３
page = agent.get("https://app-mooovi.herokuapp.com/works/third_scraping")
elements = page.search('div.etc div')

elements.each do |ele|
  puts ele.inner_text
end
