require "test_helper"
require "cells-erb"

module Post
  module Cell
    class New < Trailblazer::Cell
    end

    class Show < Trailblazer::Cell
      class SideBar < Trailblazer::Cell
        self.view_paths = ["test/concepts"]
        include ::Cell::Erb
      end

      class FlatSideBar < Trailblazer::Cell
        self.view_paths = ["test/concepts"]
        include ::Cell::Erb
        extend ViewName::Flat
      end
    end
  end
end

module Admin
  module Post
    module Cell
      class New < Trailblazer::Cell

      end

      class Show < Trailblazer::Cell
        class SideBar < Trailblazer::Cell
        end
      end
    end
  end
end

# layout cell
module Post
  module Cell
    class Layout < Trailblazer::Cell
      self.view_paths = ["test/concepts"]
      include ::Cell::Erb

      def content
        @options[:content]
      end
    end
  end
end

class CellTest < Minitest::Test
  describe "#prefixes" do
    it { Post::Cell::New.prefixes.must_equal ["app/concepts/post/view", "app/concepts/post/views"] }
    it { Post::Cell::Show.prefixes.must_equal ["app/concepts/post/view", "app/concepts/post/views"] }
    it { Post::Cell::Show::SideBar.prefixes.must_equal ["test/concepts/post/view", "test/concepts/post/views"] }
    it { Post::Cell::Show::FlatSideBar.prefixes.must_equal ["test/concepts/post/view", "test/concepts/post/views"] }

    it { Admin::Post::Cell::New.prefixes.must_equal ["app/concepts/admin/post/view", "app/concepts/admin/post/views"] }
    it { Admin::Post::Cell::Show.prefixes.must_equal ["app/concepts/admin/post/view", "app/concepts/admin/post/views"] }
    it { Admin::Post::Cell::Show::SideBar.prefixes.must_equal ["app/concepts/admin/post/view", "app/concepts/admin/post/views"] }
  end

  describe "::view_name" do
    it { Admin::Post::Cell::Show.view_name.must_equal "show" }
    it { Admin::Post::Cell::Show::SideBar.view_name.must_equal "show/side_bar" }
  end

  describe "#render" do
    it { Post::Cell::Show::SideBar.new(nil).().must_equal "$side_bar\n" }
  end

  describe "layout" do
    it { Post::Cell::Show::SideBar.new(nil, layout: Post::Cell::Layout).().must_equal "layout{$side_bar\n}\n" }
  end

  describe "flat layout" do
    it { Post::Cell::Show::FlatSideBar.new(nil, layout: Post::Cell::Layout).().must_equal "layout{$flat_side_bar\n}\n" }
  end
end
