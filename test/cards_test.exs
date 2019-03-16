defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "Create deck that contains 52 cards" do
  	deck_length = length(Cards.create_deck)
  	assert deck_length == 52
  end

  test "Shuffling a deck randomizes it" do
  	deck = Cards.create_deck
  	assert deck != Cards.shuffle deck
  end
end
