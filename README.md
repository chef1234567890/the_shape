# the_shape
配信中の youtube live を通知する Discord bot

## Description
```
+---------+       +-------------+      +-----------------------------+      +-------------+      +------+
| youtube | <---  | youtube cli | <--- |     streamer's stalker      | ---> | discord cli | ---> | gmkz |
+---------+       +-------------+      +-----------------------------+      |-------------+      +------+
                                       | youtube side | discord side |
                                       +--------------+--------------+
                                       | API key      | API key      |
                                       | ChannelIDs   | ChannelIDs   |
                                       +-----------------------------+
```

## Build
```
$ clone https://github.com/chef123456789/the_shape
$ cd the_shape
$ gem install bundler
$ bundle exec ruby app/the_shape.rb
```
