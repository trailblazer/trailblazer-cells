# Trailblazer::Cells

_Trailblazer's file layout for Cells._

## Overview

Trailblazer cells are view components based on the [Cells](https://github.com/trailblazer/trailblazer-cells) gem, but following the Trailblazer naming conventions.

### File Structure

```
├── app
│    ├── concepts
│    │   ├── blog_post
│    │   │    ├── cell
│    │   │    │   ├── edit.rb
│    │   │    │   ├── item.rb
│    │   │    │   ├── new.rb
│    │   │    │   └── show.rb
│    │   │    └── view
│    │   │        ├── edit.erb
│    │   │        ├── item.erb
│    │   │        ├── new.erb
│    │   │        └── show.erb
│    │   │        └── author_list.erb
```

### Cell Class

```ruby
# app/concepts/blog_post/cell/edit.rb
module BlogPost
  module Cell
    class Edit < Trailblazer::Cell

      # You can have helper methods.
      def post_url
        new_blog_post_path(model.id)
      end

      def summary
        "#{model.text[0..99]}..."
      end
    end # New
  end
end
```

### Views

```erb
# app/concepts/blog_post/view/edit.erb
<h1>
  You're editing <%= model.titel %>
</h1>

<div class="summary">
  <%= summary %>
</div>

<%= render :edit_form %>
```

```erb
# app/concepts/blog_post/view/edit_form.erb
<%= simple_form_for model, url: post_url do %>
  ...
<% end %>
```

### Rendering

```ruby
# app/controllers/blog_post_controller.rb
class BlogPostController < ApplicationController
  def edit
    @blog_post = BlogPost.find(params[:id]) # do whatever you need here.

    render cell(BlogPost::Cell::Edit, @blog_post)
  end
end

```


## View Prefixes

In Trailblazer, class structures such as the following are very common, let's say for a `post` concept, here are the class headers, and where the view directory gets resolved to.

```ruby
module Post
  module Cell
    class New < Trailblazer::Cell         # => app/concepts/post/view
    class Show < Trailblazer::Cell        # => app/concepts/post/view
      class SideBar < Trailblazer::Cell   # => app/concepts/post/view
```

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

## Layout

You can pass a layout cell into every `Trailblazer::Cell` which will render the layout.

```ruby
Post::Cell::Show.new(post, layout: Gemgem::Cell::Layout).()
```

The `:layout` option has to refer to a cell class. When invoked, the layout cell will receive the content of the actual cell under `:content`, resulting in a call as follows.

```ruby
Gemgem::Cell::Layout.new(post,
  content: Post::Cell::Show.new(post)
)
```

The layout cell's `show` view can sit in any directory, for example `gemgem/view/layout.rb`.

```erb
<html>
Yay, I'm the layout!

<%= content %>
</html>
```

It's up to you what you do with the `:content` option. Here's the Trailblazer way.

```ruby
class Gemgem::Cell::Layout < Trailblazer::Cell
  self.view_paths = ["gemgem"]
  def content
    @options[:content]
  end
end
```

Cells with layout cells allow replacing a frameworks entire view stack, e.g. `ActionView`.

## Namespaces

It works identical with namespaces.

## View Paths

Some projects do not use the `app/concept` view path. This can be changed as follows.

```ruby
Trailblazer::Cell.view_paths = ["concepts"]
```

Note that this will change for all cells, including bundled in gems. Introduce an `Application::Cell` if you don't like that.

## Dependencies

This gem has only one dependency: `cells`. Note that it does *not need* `trailblazer`.
