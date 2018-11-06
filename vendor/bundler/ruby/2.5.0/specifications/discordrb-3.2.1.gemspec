# -*- encoding: utf-8 -*-
# stub: discordrb 3.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "discordrb".freeze
  s.version = "3.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["meew0".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-02-18"
  s.description = "A Ruby implementation of the Discord (https://discordapp.com) API.".freeze
  s.email = ["".freeze]
  s.homepage = "https://github.com/meew0/discordrb".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Discord API for Ruby".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<opus-ruby>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<websocket-client-simple>.freeze, [">= 0.3.0"])
      s.add_runtime_dependency(%q<rbnacl>.freeze, ["~> 3.4.0"])
      s.add_runtime_dependency(%q<discordrb-webhooks>.freeze, ["~> 3.2.0.1"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
      s.add_development_dependency(%q<rspec-prof>.freeze, ["~> 0.0.7"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.45.0"])
    else
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_dependency(%q<opus-ruby>.freeze, [">= 0"])
      s.add_dependency(%q<websocket-client-simple>.freeze, [">= 0.3.0"])
      s.add_dependency(%q<rbnacl>.freeze, ["~> 3.4.0"])
      s.add_dependency(%q<discordrb-webhooks>.freeze, ["~> 3.2.0.1"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
      s.add_dependency(%q<rspec-prof>.freeze, ["~> 0.0.7"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.45.0"])
    end
  else
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<opus-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<websocket-client-simple>.freeze, [">= 0.3.0"])
    s.add_dependency(%q<rbnacl>.freeze, ["~> 3.4.0"])
    s.add_dependency(%q<discordrb-webhooks>.freeze, ["~> 3.2.0.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8.7.6"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
    s.add_dependency(%q<rspec-prof>.freeze, ["~> 0.0.7"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.45.0"])
  end
end
