module TheShape
  class DiscordBot

    def initialize
      secrets = YAML.load_file("./config/secrets.yml")
      token = secrets["discord"]["token"].freeze
      client_id = secrets["discord"]["client_id"].freeze
      @bot = Discordrb::Commands::CommandBot.new(
        token: token,
        client_id: client_id,
        prefix:'/',
      )
      @channel_list = "./config/channel_list.yml"
      @youtube_client = YoutubeClient.new
      @twitter_clinet = TwitterClient.new
    end

    def run
      settings
      @bot.run
    end

    def settings
      @bot.ready do
        @bot.game = "Dead by Daylight"
      end

      @bot.command :test do |event|
        send(event, "hello, world.#{event.user.name}")
      end

      @bot.mention do |event|
        message = @youtube_client.check(@channel_list)
        send(event, message) #unless messages.empty?
        hook_twitter(message)
      end

      @bot.command :list do |event|
        targets = []
        YAML.load_file(@channel_list).each_key { |channel_title|
          targets << channel_title
        }
        send(event, "現在の監視対象は #{targets}")
      end

      @bot.command :add do |event|
        channel_id_to_be_added = event.text.split[1]
        if @youtube_client.validate(channel_id_to_be_added)
            channel_title_to_be_added = @youtube_client.validate(channel_id_to_be_added)
            channel_list = YAML.load_file(@channel_list)
            channel_list.store(channel_title_to_be_added, channel_id_to_be_added)
            open(@channel_list, 'w') { |f| f.write(YAML.dump(channel_list)) }
            send(event, "#{channel_title_to_be_added}の監視をはじめたよー＾＾")
        else
          "そんな channel id は存在しまーーーーーーーーーーーせんv(๑・v・๑❀)v"
        end
      end

      @bot.command :delete do |event|
        channel_title_to_be_deleted = event.text.split[1]
        channel_list = YAML.load_file(@channel_list)
        if channel_list.include?(channel_title_to_be_deleted)
          channel_list.delete(channel_title_to_be_deleted)
          open(@channel_list, 'w') { |f| f.write(YAML.dump(channel_list)) }
          send(event, "#{channel_title_to_be_deleted}の監視をやめたよー；；")
        else
          "そんな人は監視してまーーーーーーーーーーーせんv(๑・v・๑❀)v"
        end
      end

      @bot.message(contains: /.*/) do |event|
        case event.message.content
        when /ひん.*/
                message = "ひん！"
        when /.*おはよう.*/
                message = "おはよう！#{event.user.name}！"
        when /.*おやすみ.*/
                message = "おやすみ！#{event.user.name}！"
        when /.*おはよう.*/
                message = "おはよう！#{event.user.name}！"
        when /.*おかえり.*/
                message = "ただいま！#{event.user.name}！"
        when /.*ただいま.*/
                message = "おかえり！#{event.user.name}！"
        when /.*おつかれ.*/
                message = "おつかれ！#{event.user.name}！"
        end
        send(event, message) if message
      end
    end

    def send(event, message)
      event.send_message(message)
    end

    def hook_twitter(message)
      # tweet 検索と follow
      @twitter_clinet.update(message.truncate(140))
      result_tweets = @twitter_clinet.search("デッドバイ")
      result_tweets[0..9].each { |tweet| @twitter_clinet.follow(tweet.user) }

      # timeline の fav
      timeline_tweets = @twitter_clinet.home_timeline
      filtered_timeline_tweets = timeline_tweets.select { |tweet| tweet.text =~ /dbd|ドバイ|dead.*by/i }
      filtered_timeline_tweets[0..9].each { |filtered_timeline_tweets| @twitter_clinet.favorite(filtered_timeline_tweets) }
    end
  end
  #DiscordBot.new.run
end
