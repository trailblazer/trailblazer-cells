require "cells"

module Trailblazer
  class Cell < ::Cell::ViewModel
    abstract!
    self.view_paths = ["app/concepts"]

    module ViewName
      # View name is everything behind the last `Cell::`.
      #   Comment::Cell::Theme::Sidebar => "theme/sidebar.haml"
      module Path
        def _view_name
          class_path = to_s.split("Cell::").last # E.g. Theme::SideBar
          util.underscore(class_path).downcase
        end
      end

      # View name is last segment, resulting in flat view hierarchy.
      #   Comment::Cell::Theme::Sidebar => "sidebar.haml"
      module Flat
        def _view_name
          class_name = to_s.split("::").last
          util.underscore(class_name).downcase
        end
      end
    end

    # TODO: this should be in Helper or something. this should be the only entry point from controller/view.
    class << self
      def class_from_cell_name(name)
        name.camelize.constantize
      end

      # Comment::Cell::Show #=> comment/view/
      def controller_path
        @controller_path ||= File.join(util.underscore(name.sub(/(::Cell.+)/, '')), views_dir)
      end

      def views_dir
        "view"
      end

      def view_name
        @view_name ||= _view_name
      end

      include ViewName::Path
    end

    # Comment::Cell::Show #=> show
    def state_for_implicit_render(options)
      self.class.view_name
    end

    alias_method :concept, :cell # TODO: test me.

    include Layout::External # from ViewModel.
  end
end
