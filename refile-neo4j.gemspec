# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "refile-neo4j"
  spec.version       = "1.0.0"
  spec.authors       = ["Andrew Havens"]
  spec.email         = ["email@andrewhavens.com"]

  spec.summary       = %q{Add Neo4j support to Refile.}
  spec.description   = %q{Add Neo4j support to Refile.}
  spec.homepage      = "https://github.com/andrewhavens/refile-neo4j"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "neo4j"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
