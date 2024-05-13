class Api::V1::TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :update, :destroy]

  def index
    tweets = Tweet.all
    render json: tweets
  end

  def show
    render json: @tweet
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      render json: tweet, status: :created
    else
      render json: tweet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tweet.update(tweet_params)
      render json: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    head :no_content
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.permit(:content)
    end
end
