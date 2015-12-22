# Trailblazer::Cells

_Trailblazer's file layout for Cells._

## View Prefixes

In Trailblazer, class structures as the following are very common, let's say for a `post` concept, here are the class headers, and where the view directory gets resolved to.

```ruby
module Post
  module Cell
    class New < Trailblazer::Cell         # => app/concepts/post/views
    class Show < Trailblazer::Cell        # => app/concepts/post/views
      class Sidebar < Trailblazer::Cell   # => app/concepts/post/views
```

## View Paths

Some projects do not use the `app/concept` view path.

## View Name

## Application Layout

## Namespaces

It works identical with namespaces.


## Dependencies

This gem has only one dependency: `cells`. Note that it does *not need* `trailblazer`.
