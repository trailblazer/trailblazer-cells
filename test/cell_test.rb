require 'test_helper'

module Post
  module Cell
    class New < ::Cell::ViewModel

    end

    class Show < ::Cell::ViewModel
      class Sidebar < ::Cell::ViewModel

      end
    end
  end
end

module Admin
  module Post
    module Cell
      class New < ::Cell::ViewModel

      end

      class Show < ::Cell::ViewModel
        class Sidebar < ::Cell::ViewModel

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
