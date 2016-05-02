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

      def view_name
        @view_name ||= _view_name
      end

      def _view_name
        class_name = to_s.split("::").last
        util.underscore(class_name).downcase
      end
    end

    def state_for_implicit_render(options)
      self.class.view_name
    end

    alias_method :concept, :cell # TODO: test me.

    # Automatic #show so you don't need to define it. Still overridable.
    module Show
      def show
        render view: :show
      end
    end
    include Show

    include Layout::External # from ViewModel.
  end
end
