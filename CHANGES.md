# 0.0.3

* Introduce `Cell::ViewName::Flat` and `Cell::ViewName::Path`. Note that with a segmented cell suffix, such as in `Comment::Cell::Theme::Sidebar`, this will, per default result in a view name `theme/sidebar.haml` in the cell's `view` directory. Use `ViewName::Flat` for the old behavior (`sidebar.haml`).

# 0.0.2

* Stable release for Cells 4.1. We probably move the view name inflector into Cells itself?

# 0.0.1

* First release into an unsuspecting world.
