defmodule Cards do
  @moduledoc """
    provides methods for creating and handling a deck of cards
  """

  @doc """
    returns a list of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    splits the deck of cards into two parts, the first part is returned.
    the number of cards in the first part is specified by `hand_size`

  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.deal(deck, 1)
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    dealed_cards = Enum.split(deck, hand_size)
    elem(dealed_cards, 0)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    determines whether a given card exists in the deck

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Random")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck
    # shuffled_deck = Cards.shuffle(deck)
    # Cards.deal(shuffled_deck, hand_size)

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)    
  end
end
