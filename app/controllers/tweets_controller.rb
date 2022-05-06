class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  around_action :set_time_zone, if: :current_user

  def index
    @tweets = current_user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: "Tweet has been scheduled."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet has been updated."
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet has been deleted."
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :twitter_account_id, :publish_at)
  end

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end
end
