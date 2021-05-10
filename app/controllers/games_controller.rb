class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
    @random = []
    10.times { @random << @letters.sample.capitalize }
  end

  def score

  end
end
