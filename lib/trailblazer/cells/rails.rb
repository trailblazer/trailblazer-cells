require "rails/railtie"
require "trailblazer/cells"

module Cell
  class Railtie < Rails::Railtie

    initializer "cells.update_view_paths" do |app|
      # Add Rails.root to view_paths
      Trailblazer::Cell.view_paths = [Rails.root.join("app", "concepts")]
    end
  end
end
