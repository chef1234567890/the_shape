module TheShape
  class TwitterClient

    def initialize
      secrets = YAML.load_file("./config/secrets.yml")
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = secrets["twitter"]["consumer_key"].freeze
        config.consumer_secret     = secrets["twitter"]["consumer_secret"].freeze
        config.access_token        = secrets["twitter"]["access_token"].freeze
        config.access_token_secret = secrets["twitter"]["access_secret"].freeze
      end
    end

    def update(message)
      @client.update(message)
    end

    def favorite(tweet)
      begin
        @client.favorite(tweet.id) unless tweet.user.screen_name == @client.user.screen_name
      rescue Twitter::Error::TooManyRequests => error
        # nothing to do
      end
    end

    def home_timeline
      @client.home_timeline
    end

    def search(word)
      tweets = @client.search(word)
      tweets.select { |tweet| tweet.text.include?(word) }
    end

    def follow(user)
      begin
        @client.follow(user.id) unless user.following?
      rescue Twitter::Error::TooManyRequests => error
        # nothing to do
      end
    end
  end
end
