class Scraping
  def self.movie_urls
    #①linksという配列の空枠を作る
    #②Mechanizeクラスのインスタンスを生成する
    #③映画の全体ページのURLを取得
    #④全体ページから映画20件の個別URLのタグを取得
    #⑤個別URLのタグからhref要素を取り出し、links配列に格納する
    #⑥get_productを実行する際にリンクを引数として渡す
  end

  def self.get_product(link)
    #⑦Mechanizeクラスのインスタンスを生成する
    #⑧映画の個別ページのURLを取得
    #⑨inner_textメソッドを利用し映画のタイトルを取得
    #⑩image_urlがあるsrc要素のみを取り出す
    #①①newメソッド、saveメソッドを使い、 スクレイピングした「映画タイトル」と「作品画像のURL」をproductsテーブルに保存
  end
end