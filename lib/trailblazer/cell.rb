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

    # Automatic #show so you don't need to define it. Still overridable.
    module Show
      def show
        render
      end
    end
    include Show

    module Layout
      def render(options={})
        options[:layout] = @options[:layout] if @options[:layout]
        super
      end

      def with_layout(options, content)
        return content unless layout = options[:layout]
        layout.new(model, parent_controller: parent_controller, content: content) # TODO: test parent_controller.
      end
    end
    include Layout
  end
end
