require 'mechanize'

agent = Mechanize.new
page = agent.get("https://app-mooovi.herokuapp.com/works/initial_scraping")
elements = page.search('p')
puts elements

