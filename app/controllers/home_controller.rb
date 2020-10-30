class HomeController < ApplicationController
  def index
    @cards = Card.order('RANDOM()').limit(10)
  end
end
