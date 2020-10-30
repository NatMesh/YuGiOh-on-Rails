class CardsController < ApplicationController
  def index
    @cards = Card.all
    @monsters = MonsterCard.includes(:card).all
  end
  #The @cards variable will be shared with:
  #app/views/cards/index.html.erb
  #NOTE other models can be called and shared to this view as well

  # <ul>
  #   <% @monsters.each do |monster| %>
  #     <li><%= monster.card.name %> has an atk of <%= monster.attack %></li>
  #   <% end %>
  # </ul>

  def show
    @card = Card.find(params[:id])
    @monster = MonsterCard.where(card_id: params[:id]).first
    @monsters = MonsterCard.includes(:card).all
  end
  #The @card variable will be shared with:
  #app/views/cards/show.html.erb

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @cards = Card.where("name LIKE ?", wildcard_search)
  end
end
