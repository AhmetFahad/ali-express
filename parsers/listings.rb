nokogiri = Nokogiri.HTML(content)

products = nokogiri.at_css("li.list-item")

products.each do |product|
  

end  