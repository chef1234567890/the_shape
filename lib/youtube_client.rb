module TheShape
  class YoutubeClient

    def initialize
      secrets = YAML.load_file("./config/secrets.yml")
      api_key = secrets["youtube"]["api_key"].freeze
      Yt.configure do |config|
        config.api_key = api_key
      end
    end

    def check(channel_list)
      fetch_recent_videos = Parallel.map(YAML.load_file(channel_list), in_processes: 4, in_threads: 8) do |channel_title, channel_id|
        videos = fetch_from_id(channel_id, "videos")
        fetch_recent(videos)
      end

      message = ""
      fetch_recent_videos.each  do |video|
        begin
          if is_live?(video)
            message += "https://www.youtube.com/watch?v=#{video.id}\n"
          end
        rescue
          next  # no videos
        end
      end

      message += "誰も配信してないよー；；" if message.empty?
      message
    end

    def fetch_from_id(channel_id, kind="title")
      channel = Yt::Channel.new  id: channel_id
      case kind
      when "videos"
        channel.videos
      when "title"
        channel.title
      end
    end

    def fetch_recent(videos)
      # refactor: count を使いたくない
      count = 0
      begin
        videos.each { |video_info|
          count += 1
          video = Yt::Video.new id: video_info.id
          return video if is_live?(video)
          break if count == 3
        }
        videos.first
      rescue
        videos.first
      end
    end

    def is_live?(video)
      video.live_broadcast_content == "live"
    end

    def validate(channel_id)
      begin
        channel = Yt::Channel.new  id: channel_id
        channel.title
      rescue
        false
      end
    end

    def resoleve_title(channel_id_list)
      channel_title_list = []
      channel_id_list.each { |channel_id|
        channel = Yt::Channel.new  id: channel_id
        channel_title_list << channel.title
      }
      channel_title_list
    end
  end
  #YoutubeClient.new.check
end
