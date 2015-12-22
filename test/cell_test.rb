require "test_helper"

module Post
  module Cell
    class New < Trailblazer::Cell

    end

    class Show < Trailblazer::Cell
      class Sidebar < Trailblazer::Cell

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
        class Sidebar < Trailblazer::Cell

        end
      end
    end
  end
end

class CellTest < Minitest::Test
  describe "#prefixes" do
    it { Post::Cell::New.prefixes.must_equal ["app/concepts/post/view"] }
    it { Post::Cell::Show.prefixes.must_equal ["app/concepts/post/view"] }
    it { Post::Cell::Show::Sidebar.prefixes.must_equal ["app/concepts/post/view"] }

    it { Admin::Post::Cell::New.prefixes.must_equal ["app/concepts/admin/post/view"] }
    it { Admin::Post::Cell::Show.prefixes.must_equal ["app/concepts/admin/post/view"] }
    it { Admin::Post::Cell::Show::Sidebar.prefixes.must_equal ["app/concepts/admin/post/view"] }
  end
end
