nokogiri = Nokogiri.HTML(content)

products = nokogiri.at_css("li.list-item")

products.each do |product|
  title = product.css(".item-title").text
  url = product.css(".place-container a").attr('href').text

  pages{
    url: url,
    page_type: 'product',
    vars: {
      'title' => title
    }

  }

end  