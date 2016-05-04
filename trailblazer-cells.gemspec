lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trailblazer/cells/version"

Gem::Specification.new do |spec|
  spec.name          = "trailblazer-cells"
  spec.version       = Trailblazer::Cells::VERSION
  spec.authors       = ["Nick Sutterer"]
  spec.email         = ["apotonick@gmail.com"]

  spec.summary       = %q{Trailblazer's file layout with Cells.}
  spec.description   = %q{Cells that integrate with Trailblazer's file layout.}
  spec.homepage      = "http://trailblazer.to/gems/cells"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "cells-erb"

  spec.add_dependency "cells", ">= 4.1.0.rc1", "< 5.0.0"
end
