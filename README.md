# Trailblazer::Cells

_Trailblazer's file layout for Cells._

## View Prefixes

In Trailblazer, class structures as the following are very common, let's say for a `post` concept, here are the class headers, and where the view directory gets resolved to.

```ruby
module Post
  module Cell
    class New < Trailblazer::Cell         # => app/concepts/post/views
    class Show < Trailblazer::Cell        # => app/concepts/post/views
      class SideBar < Trailblazer::Cell   # => app/concepts/post/views
```

## View Paths

Some projects do not use the `app/concept` view path.


## Automatic `show`

You don't have to define a `show` method, `Trailblazer::Cell` will have one that looks as follows.

```ruby
class Trailblazer::Cell
  def show
    render
  end
```

## View Name

When calling `render`, the view name is inferred from the class name.

```ruby
module Post
  module Cell
    class New < Trailblazer::Cell         # => new.erb
    class Show < Trailblazer::Cell        # => show.erb
      class SideBar < Trailblazer::Cell   # => side_bar.erb
```

You can still override using `render view: :name`.

## Application Layout

## Namespaces

It works identical with namespaces.


## Dependencies

This gem has only one dependency: `cells`. Note that it does *not need* `trailblazer`.
