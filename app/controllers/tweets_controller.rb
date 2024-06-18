class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
    end
  
    def show
      @tweet = Tweet.find(params[:id])
    end
  
    def new
      @tweet = Tweet.new
    end
  
    def create
      @tweet = Tweet.new(tweet_params)
      if @tweet.save
        flash[:notice] = "Tweet was successfully created."
        redirect_to @tweet
      else
        flash.now[:alert] = "There was a problem creating the tweet."
        render 'new'
      end
    end
  
    def update
      @tweet = Tweet.find(params[:id])
      if @tweet.update(tweet_params)
        flash[:notice] = "Tweet was successfully updated."
        redirect_to @tweet
      else
        flash.now[:alert] = "There was a problem updating the tweet."
        render 'edit'
      end
    end
  
    def edit
        @tweet = Tweet.find(params[:id])
      end

    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
      redirect_to tweets_path
    end
  
    private
  
    def tweet_params
      params.require(:tweet).permit(:content)
    end
  end
  