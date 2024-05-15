class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:edit, :update]  # 追加
  
    def create
      song = Song.find(params[:song_id])
      comment = song.comments.build(comment_params)
      comment.user_id = current_user.id
      if comment.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = "コメントできませんでした"  # メッセージ修正
        redirect_back(fallback_location: root_path)
      end
    end
  
    def edit
        @song = Song.find(params[:song_id])  # song_id から @song インスタンスを取得
        @comment = Comment.find(params[:id])  # id から @comment インスタンスを取得
      end      
  
    def update
      # 追加
      if @comment.update(comment_params)
        flash[:success] = "コメントを更新しました"
        redirect_to song_path(@comment.song)
      else
        render :edit
      end
    end
  
    private
  
      def comment_params
        params.require(:comment).permit(:content)
      end
  
      def set_comment
        @comment = Comment.find(params[:id])
      end
  end
  
