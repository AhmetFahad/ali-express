nokogiri = Nokogiri.HTML(content)

products = nokogiri.css("li.list-item")

products.each do |product|
  title = product.css(".item-title").text
  a = product.css(".place-container a")
  if a
    url = URI.join('https:', a.attr('href')).to_s.split('?').first
    if url =~ /\Ahttps?:\/\//i
      pages << {
        url: url,
        page_type: 'products',
        vars: {
          'title' => title
        }

      }
    end
  end    
end  


page_number = html.css('.next-pagination-pages .next-pagination-list button').last.text.to_i
if vars['page'] < page_number
  pages << {
    url: "https://www.aliexpress.com/category/7/computer-office.html?trafficChannel=main&catName=computer-office&CatId=7&ltype=wholesale&SortType=default&page=#{vars['page']+1}&isrefine=y",
    page_type: 'listings',
   vars: {
     page_number: vars['page_number'] + 1
   }
  }
end