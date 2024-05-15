class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :authenticate_user!
  
    def show
        @user = User.find(params[:id])
        @songs = @user.songs  # ユーザーのツイートを取得
        @liked_songs = @user.liked_songs  # ユーザーがいいねした曲を取得
        @comments_songs = @user.comments_songs
      end
      
  
    def index
      @users = User.all
    end  
    def edit
        @user = User.find(params[:id])
      end
    
      def update
        # ユーザー情報の更新処理
        if @user.update(user_params)
          redirect_to @user, notice: 'プロフィールが更新されました。'
        else
          render :edit
        end
      end

      def my_page
       @voted_songs = Song.where(id: current_user.voted_song_ids)
      end

    
      private
    
      def set_user
        @user = User.find(params[:id])
      end
    
      def user_params
        params.require(:user).permit(:name, :email, :profile, :image)
      end
      def set_minimum_password_length
        @minimum_password_length = Devise.password_length.min
      end
  end
  
