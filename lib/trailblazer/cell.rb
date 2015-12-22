require "cells"

module Trailblazer
  class Cell < ::Cell::ViewModel
    abstract!
    self.view_paths = ["app/concepts"]

    # TODO: this should be in Helper or something. this should be the only entry point from controller/view.
    class << self
      def class_from_cell_name(name)
        name.camelize.constantize
      end

      def controller_path
        @controller_path ||= File.join(util.underscore(name.sub(/(::Cell.+)/, '')), views_dir)
      end

      def views_dir
        "view"
      end
    end
  end
end
