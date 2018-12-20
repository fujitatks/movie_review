class Scraping
  def self.movie_urls
    #①linksという配列の空枠を作る
    links = []
    #②Mechanizeクラスのインスタンスを生成する
    agent = Mechanize.new
        # パスの部分を変数で定義(はじめは、空にしておきます)
    next_url = ""

    while true do

      current_page = agent.get("http://review-movie.herokuapp.com" + next_url)
      elements = current_page.search(".entry-title a")
      elements.each do |ele|
        links << ele.get_attribute('href')
      end

      # 「次へ」を表すタグを取得
      next_link = current_page.at('.pagination .next a') 

      # next_linkがなかったらwhile文を抜ける
      unless next_link
        break
      end

      # そのタグからhref属性の値を取得
      next_url = next_link.get_attribute('href')


    end

    # #③映画の全体ページのURLを取得
    # pagen1 = "http://review-movie.herokuapp.com"
    # page = agent.get(pagen1)
    # #④全体ページから映画20件の個別URLのタグを取得
    # elements = page.search('h2.entry-title a')
    # #⑤個別URLのタグからhref要素を取り出し、links配列に格納する
    # elements.each do |ele|
    #   pagen2 = ele.get_attribute('href')
    #   links << pagen1+pagen2
    # end
    # #⑥get_productを実行する際にリンクを引数として渡す
    get_product(links)
  end

  def self.get_product(link)
    #⑦Mechanizeクラスのインスタンスを生成する
    agent = Mechanize.new
    #⑧映画の個別ページのURLを取得
    link.each do |li1|
      page = agent.get("http://review-movie.herokuapp.com" + li1)
      #⑨inner_textメソッドを利用し映画のタイトルを取得
      elements = page.search('.entry-title')
      title = elements.inner_text
      # p page
      #⑩image_urlがあるsrc要素のみを取り出す
      image_url = page.at('.entry-content img')[:src] if page.at('.entry-content img') 
      director = page.at('.director span').inner_text if page.at('.director span')
      detail = page.at('.entry-content p').inner_text if page.at('.entry-content p')
      open_date = page.at('.date span').inner_text if page.at('.date span')
      puts director
      puts detail
      puts open_date
      # p image_url
      # p elements2
      # elements2.each do |ele|
      #   p ele
      #   image_url = ele.get_attribute('src') if ele.get_attribute('src')
      # end
    #①①newメソッド、saveメソッドを使い、 スクレイピングした「映画タイトル」と「作品画像のURL」をproductsテーブルに保存
      product = Product.where(title: title, image_url: image_url).first_or_initialize
      product.director = director
      product.detail = detail
      product.open_date = open_date
      product.save
    end
  end
end