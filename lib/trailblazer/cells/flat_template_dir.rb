module Trailblazer
  class Cell < ::Cell::ViewModel
    module FlatTemplateDir
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def _view_name
          class_name = to_s.split("::").last
          util.underscore(class_name).downcase
        end
      end
    end
  end
end
