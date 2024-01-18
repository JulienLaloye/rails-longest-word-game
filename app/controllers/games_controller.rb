require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('A'...'Z').to_a.sample(10)
  end

  def score
    @score = 0
    @url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @user_serialized = URI.open(@url).read
    @user = JSON.parse(@user_serialized)
    # @word = params[:word].split.sort.to_s
    # @letters = params[:letters].sort.to_s

    if @user["found"] == true
       @result = "The word #{params[:word]} is a valid English word!"
       @score += @user["length"]
    else
      @result = "The word #{params[:word]} is not a valid English word..."
      @score
    end

    # if params[:letters].include?(params[:word])
    #   @score = params[:word].length
    # else
    #   @score = 0
    # end
  end
end
