require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    newletters = []
    10.times do
      newletters << ('a'..'z').to_a.sample
    end
    @letters = newletters
  end

  def score
    if params[:word].split.all? do |letter|
      params[:letters].include?(letter)
    end
  end
    @answer = word(params[:word])
  end

  def word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    if json['found']
      "Congratulations #{word} is a valid English word"
    else
      "Sorry but #{word} does not seem to be a valid English word..."
    end
  end
end
