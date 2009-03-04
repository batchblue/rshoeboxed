require 'date'
require 'rexml/document'

module RShoeboxed
  class BusinessCard
    attr_accessor :id , :first_name,:last_name,:address,:address_2,
                :city,:state,:zip,:country,:email,:website,
                :company,:position,:work_phone,:cell_phone,:fax,
                :front_img_url,:back_img_url,:created_date, :modified_date
    
    def self.parse(xml)
      document = REXML::Document.new(xml)
      document.elements.collect("//BusinessCard") do |card_element|
        card = BusinessCard.new
        begin
          card.id = card_element.attributes["id"]
          card.first_name = card_element.attributes["firstName"]
          card.last_name = card_element.attributes["lastName"]     
          card.address = card_element.attributes["address"]          
          card.address_2 = card_element.attributes["address2"]          
          card.city = card_element.attributes["city"]          
          card.state = card_element.attributes["state"]    
          card.zip = card_element.attributes["zip"]        
          card.country = card_element.attributes["country"]        
          card.email = card_element.attributes["email"]        
          card.website = card_element.attributes["website"] 
          card.company = card_element.attributes["company"] 
          card.position = card_element.attributes["position"]                
          card.work_phone = card_element.attributes["workPhone"]  
          card.cell_phone = card_element.attributes["cellPhone"]  
          card.fax = card_element.attributes["fax"]  
          card.front_img_url = card_element.attributes["frontImgUrl"] 
          card.back_img_url = card_element.attributes["backImgUrl"]     
          card.created_date = card_element.attributes["created_date"]   
          card.modified_date = card_element.attributes["modifiedDate"]        
        rescue => e
          raise RShoeboxed::ParseError.new(e, card_element.to_s, "Error parsing card.")
        end
        card
      end
    end
    
    def created_date=(date)
      date = Date.parse(date) if date.is_a?(String)
      @created_date = date
    end
    
    def modified_date=(date)
      date = Date.parse(date) if date.is_a?(String)
      @modified_date = date
    end
    
    def ==(card)
      self.id == card.id
    end
  end
end
