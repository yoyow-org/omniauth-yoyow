
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth-yoyow/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-yoyow"
  spec.version       = Omniauth::Yoyow::VERSION
  spec.licenses      = ['MIT']
  spec.authors       = ["Bin Chen"]
  spec.email         = ["fengzhishuiwo@163.com"]

  spec.summary       = %q{Official OmniAuth strategy for yoyow.}
  spec.description   = %q{Official OmniAuth strategy for yoyow.}
  spec.homepage      = "https://coding.net/u/vianull/p/omniauth-yoyow/git"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency 'omniauth', '~> 1.5'
  spec.add_dependency "multi_json"
  spec.add_dependency "faraday"
end
