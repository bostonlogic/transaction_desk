require_relative 'lib/transaction_desk/version'

Gem::Specification.new do |spec|
  spec.name          = "transaction_desk"
  spec.version       = TransactionDesk::VERSION
  spec.authors       = ["Mwaki Harri Magotswi"]
  spec.email         = ["magotswi@gmail.com"]

  spec.summary       = %q{Ruby library for the Transaction Desk API.}
  spec.description   = %q{A Ruby wrapper around the Transaction Desk API.}
  spec.homepage      = "https://github.com/bostonlogic/transaction_desk"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bostonlogic/transaction_desk"
  spec.metadata["changelog_uri"] = "https://github.com/bostonlogic/transaction_desk"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'virtus', '~> 1.0.3'
  spec.add_dependency 'resource_kit', '~> 0.1.5'
  spec.add_dependency 'kartograph', '~> 0.2.3'
  spec.add_dependency 'faraday', '>= 0.15.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry'
end
