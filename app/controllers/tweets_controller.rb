class TweetsController < ApplicationController
    def index
      @tweets = Tweet.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
        if params[:search] == nil
          @tweets= Tweet.all.page(params[:page]).per(6)
      elsif params[:search] == ''
        @tweets= Tweet.all.page(params[:page]).per(6)
      else
        #部分検索
        @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(6)
      end
    end



    def new
        @tweet = Tweet.new
    end

    def create
      @tweet = Tweet.new(tweet_params)
      @tweet.user_id = current_user.id
      if @tweet.save and @tweet.genre == 1
          redirect_to :action => "page1"
      elsif @tweet.save and @tweet.genre == 2
          redirect_to :action => "page2"
      elsif @tweet.save and @tweet.genre == 3
          redirect_to :action => "page3"
      elsif @tweet.save and @tweet.genre == 4
          redirect_to :action => "page4"
      elsif @tweet.save and @tweet.genre == 5
          redirect_to :action => "page5"
      elsif @tweet.save and @tweet.genre == 6
          redirect_to :action => "page6"
      elsif @tweet.save and @tweet.genre == 7
          redirect_to :action => "page7"
        elsif @tweet.save and @tweet.genre == 8
          redirect_to :action => "page8"
        elsif @tweet.save and @tweet.genre == 9
          redirect_to :action => "page9"
        elsif @tweet.save and @tweet.genre == 10
          redirect_to :action => "page10"
        elsif @tweet.save and @tweet.genre == 11
          redirect_to :action => "page11"
        elsif @tweet.save and @tweet.genre == 12
          redirect_to :action => "page12"
      else
          redirect_to :action => "index"
      end
  end
    
      def show
        @tweet = Tweet.find(params[:id])
        @comments = @tweet.comments
        @comment = Comment.new
      end

      def edit
        @tweet =  Tweet.find(params[:id])
      end

      def update
        tweet = Tweet.find(params[:id])
        if tweet.update(tweet_params)
          redirect_to :action => "show", :id => tweet.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to action: :index
      end

      def page1
      @tweet1 = Tweet.where(genre: 1)
      end
      def page2
      @tweet2 = Tweet.where(genre: 2)
      end
      def page3
      @tweet3 = Tweet.where(genre: 3)
      end
      def page4
      @tweet4 = Tweet.where(genre: 4)
      end

      def page5
      @tweet5 = Tweet.where(genre: 5)
      end
      def page6
      @tweet6 = Tweet.where(genre: 6)
      end
      def page7
      @tweet7 = Tweet.where(genre: 7)
      end
      def page8
      @tweet8 = Tweet.where(genre: 8)
      end

      def page9
      @tweet9 = Tweet.where(genre: 9)
      end
      def page10
      @tweet10 = Tweet.where(genre: 10)
      end
      def page11
      @tweet11 = Tweet.where(genre: 11)
      end
      def page12
      @tweet12 = Tweet.where(genre: 12)
      end

      

      private
      def tweet_params
        params.require(:tweet).permit(:body, :image, :genre, tag_ids: [])
      end
end

