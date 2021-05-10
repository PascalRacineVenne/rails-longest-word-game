require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
    @random = []
    10.times { @random << @letters.sample.capitalize }
  end

  def score
    @answer = @params[:word]
    @result = api
    # 3 case scenarios
    # The word can’t be built out of the original grid
    # The word is valid according to the grid, but is not a valid English word
    # The word is valid according to the grid and is an English word
  end

    # create method for API call had require relative on top.
  def api
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    response = URI.open(url).read
    json = JSON.parse(response)
    return json['found']
  end
end
