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

  end
end
