nokogiri = Nokogiri.HTML(content)

products = nokogiri.css(".list-item")

products.each do |product|
  a = product.css(".item-title-wrap a")
  if a
    url = URI.join('https:', a.attr('href')).to_s.split('?').first
    if url =~ /\Ahttps?:\/\/.+/
      pages << {
        url: url,
        page_type: 'products',
        vars: {}

      }
    end
  end    
end  


pagination = nokogiri.css('.next-btn').select{ |element| /Page \d, \d pages/.match(element.attr('aria-label'))}
pagination.each.with_index do |pag,i|
  pages << {
    url: "https://www.aliexpress.com/category/7/computer-office.html?trafficChannel=main&catName=computer-office&CatId=7&ltype=wholesale&SortType=default&page=#{i+2}",
    page_type: 'listings',
    vars: {
   }
  }
end