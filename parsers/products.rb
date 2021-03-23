nokogiri = Nokogiri.HTML(content)

# initialize an empty hash
product = {}

#extract title
product['title'] = nokogiri.at_css('h1.product-title-text').strip

#extract current price
product['current_price'] = nokogiri.at_css('.oyuLA').strip

#extract original price
product['original_price'] = nokogiri.at_css('._3ttT3 span')



#extract current price
product['current_price'] = nokogiri.at_css('.product-price-value')

#extract original price
product['original_price'] = nokogiri.at_css('.product-price-del .product-price-value')


#extract rating
rating = nokogiri.at_css('.overview-rating-average')
product['rating'] = rating == "0" ? nil : rating

#extract number of reviews
product['reviews_count'] = nokogiri.at_css('.product-reviewer-reviews black-link')
 

#extract product image
product['img_url'] = "https:"+nokogiri.at_css('.magnifier-image').attr("src")

# specify the collection where this record will be stored
product['_collection'] = 'products'

# save the product to the job’s outputs
outputs << product