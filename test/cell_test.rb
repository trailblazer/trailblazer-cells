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

class CellTest < Minitest::Test
  describe "#prefixes" do
    it { Post::Cell::New.prefixes.must_equal ["app/concepts/post/view"] }
    it { Post::Cell::Show.prefixes.must_equal ["app/concepts/post/view"] }
    it { Post::Cell::Show::SideBar.prefixes.must_equal ["test/concepts/post/view"] }

    it { Admin::Post::Cell::New.prefixes.must_equal ["app/concepts/admin/post/view"] }
    it { Admin::Post::Cell::Show.prefixes.must_equal ["app/concepts/admin/post/view"] }
    it { Admin::Post::Cell::Show::SideBar.prefixes.must_equal ["app/concepts/admin/post/view"] }
  end

  describe "#render" do
    it { Post::Cell::Show::SideBar.new(nil).().must_equal "$side_bar\n" }
  end
end
