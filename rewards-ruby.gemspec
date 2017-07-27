lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rewards/version"

Gem::Specification.new do |s|
  s.name        = "rewards-ruby"
  s.version     = Rewards::VERSION
  s.authors     = ["Timur Vafin"]
  s.email       = ["timur.vafin@flatstack.com"]
  s.homepage    = "https://github.com/fs/rewards-ruby"
  s.summary     = "Rewards Ruby API"
  s.description = "Rewards Ruby API"
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "README.md"]

  s.add_dependency "active_model_serializers"
  s.add_dependency "httparty"

  s.add_development_dependency "rake"
  s.add_development_dependency "webmock"
  s.add_development_dependency "bundler-audit"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-rspec"
end
