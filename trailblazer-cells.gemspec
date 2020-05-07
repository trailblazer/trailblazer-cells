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

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test)/}) }
  spec.require_paths = ["lib"]
  spec.licenses      = ["LGPLv3"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "cells-erb"

  spec.add_dependency "cells", ">= 4.1.0", "< 5.0.0"
  spec.add_development_dependency "rubocop", "0.76.0" # to avoid cops renaming in the general rubocop file
end
