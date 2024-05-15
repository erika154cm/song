class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    if params[:search].present?
      @searched_songs = Song.where("name LIKE ?", "%#{params[:search]}%")
    else
      @searched_songs = [] # 検索クエリがない場合は空の配列を返す
    end

    if params[:search].blank?
      @songs = Song.all
    else
      @songs = Song.where("name LIKE ? OR aritist LIKE ? OR about LIKE ? OR composer LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:tag_ids]
      @songs = []
      params[:tag_ids].each do |key, value|      
        @songs += Tag.find_by(name: key).songs if value == "1"
      end
      @songs.uniq!
    end

    @rank_songs = Song.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(20)
  end

  def search
    if params[:search].present?
      @songs = Song.where("name LIKE ?", "%#{params[:search]}%")
    else
      @songs = []
    end
  end

    def new
        @song = Song.new
    end

    def create
      song = Song.new(song_params)
      song.user_id = current_user.id
      
      if song.save
        redirect_to :action => "index"
      else
        # デバッグ情報の出力
        Rails.logger.debug(song.errors.full_messages)
        render :new
      end
    end
    
      

    def show
      @song = Song.find_by(id: params[:id])
      if @song.nil?
        redirect_to songs_path, alert: "指定された曲が見つかりませんでした。"
      end
      @user_name = @song.user.name if @song.user
      @comments = @song.comments
        @comment = Comment.new
    end
    

    def update
      @song = Song.find(params[:id])
      if @song.update(song_params)
        redirect_to song_path(@song)
      else
        render 'edit'
      end
    end
    

    def edit
      @song = Song.find(params[:id])
    end

    def destroy
      song = Song.find(params[:id])
      song.destroy
      redirect_to action: :index
    end    
    
    private

    def song_params
      params.require(:song).permit(:name, :aritist, :year, :about, :composer, :song_type, :age, :youtube_url, tag_ids: [])
    end    

end