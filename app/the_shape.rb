require 'byebug'
require 'yaml'
require 'parallel'
require './lib/discord_bot.rb'
require 'discordrb'
require './lib/youtube_client.rb'
require 'yt'
require './lib/twitter_client.rb'
require 'twitter'

TheShape::DiscordBot.new.run
