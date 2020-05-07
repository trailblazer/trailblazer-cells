source 'https://rubygems.org'

gemspec
case ENV['GEMS_SOURCE']
  when 'local'
    gem "cells", path: "../cells"
  when 'github'
    gem "reform", github: "trailblazer/cells"
  when 'custom'
    eval_gemfile('GemfileCustom')
  else # use rubygems releases
    gem "cells"
end
