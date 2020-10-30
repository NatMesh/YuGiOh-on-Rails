#needed to gain access to json methods and properties in rails
require 'json'

LinkMarker.delete_all
Marker.delete_all
MonsterCard.delete_all
Card.delete_all

#grabs our json file to use
file = File.read('db/yugioh_cards.json')
#parses our data into a variable so it is readable to Ruby on Rails
yugioh_cards = JSON.parse(file)



yugioh_cards["data"][0..150].each do |y|
  #creates our card record
  if y["archetype"].nil?
    card = Card.find_or_create_by(
          name: y["name"],
          card_type: y["type"],
          description: y["desc"],
          race: y["race"],
          card_image: y["card_images"][0]["image_url"],
          card_image_small: y["card_images"][0]["image_url_small"]
        )
  else
    card = Card.find_or_create_by(
          name: y["name"],
          card_type: y["type"],
          description: y["desc"],
          race: y["race"],
          archetype: y["archetype"],
          card_image: y["card_images"][0]["image_url"],
          card_image_small: y["card_images"][0]["image_url_small"]
        )
  end

  #if card is valid and it is a monster type card we will add a record to our MonsterCard table
  if card&.valid? && y["type"].include?("Monster")
    #Create monster_card
    #creating a monster_card this way automatically sets the foreign key of our card
    if y["type"].include? "Pendulum"
      monster_card = card.monster_cards.create(
          attack: y["atk"],
          defense: y["def"],
          level: y["level"],
          monster_attribute: y["attribute"],
          scale: y["scale"]
        )

    elsif y["type"].include? "Link"
      #NOTE link monsters do not have defence value or level
      monster_card = card.monster_cards.create(
          attack: y["atk"],
          monster_attribute: y["attribute"],
          link_value: y["linkval"]
        )

      #We will now create the marker and link_marker table since it only pertains to link monsters
      markers = y["linkmarkers"].split(",")
      markers.each do |marker_name|
        marker = Marker.find_or_create_by(marker_direction: marker_name)
        LinkMarker.create(monster_card: monster_card, marker: marker)
      end
    else
    monster_card = card.monster_cards.create(
          attack: y["atk"],
          defense: y["def"],
          level: y["level"],
          monster_attribute: y["attribute"]
        )
    end

    if monster_card&.valid?
      #puts "monster card created"
    else
      #puts "Invalid monster_card #{monster_card.errors.messages}"
    end

  # else
  #   puts "Invalid card #{card.errors.messages}"
  end
end

puts "Created #{Card.count} cards"
puts "Created #{MonsterCard.count} monster cards"
puts "Created #{Marker.count} Markers"
puts "Created #{LinkMarker.count} LinkMarkers"

#THIS DEFINES A CARD IN OUR TABLE
#:name, :card_type, :description, :race, :card_image, :card_image_small
#object.nil? returns true if it is nil, returns false if it is EXISTS
# puts yugioh_cards["data"][0]["name"]
# puts yugioh_cards["data"][0]["type"]
# puts yugioh_cards["data"][0]["desc"]
# puts yugioh_cards["data"][0]["race"]
# if yugioh_cards["data"][0]["archetype"].nil?
#   puts "nil"
# else
#   puts yugioh_cards["data"][0]["archetype"]
# end
# puts yugioh_cards["data"][0]["card_images"][0]["image_url"]
# puts yugioh_cards["data"][0]["card_images"][0]["image_url_small"]

