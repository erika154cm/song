module SongsHelper
    def find_youtube_url(youtube_url)
      return "YouTube URLがありません" if youtube_url.nil? || youtube_url.empty?
  
      if youtube_url.include?("youtu.be/")
        return youtube_url.split("/")[-1]
      elsif youtube_url.include?("watch?v=")
        return youtube_url.split("v=").last[0..10]
      else
        return "無効なYouTube URLです"
      end
    end
  end
  