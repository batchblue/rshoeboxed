require File.dirname(__FILE__) + '/test_helper.rb'

class TestBusinessCard < Test::Unit::TestCase
  include RShoeboxed

  
  def test_initialize_parse_xml
    response = fixture_xml_content("business_card_response")
    cards = BusinessCard.parse(response)
    assert_equal 4, cards.size
    
    card = cards.first
    assert_equal "331378049", card.id
    assert_equal "Davies", card.last_name 
    assert_equal "https://www.shoeboxed.com/business-card.jpeg?bcid=331378049&code=eb43ab329ef9902ps27bf2c1e4a93c51", card.front_img_url
  end
         
end
