# bundler-private_install

A Bundler plugin that installs additional gems listed in a separate Gemfile.

This is especially useful when you always use certain gems in development but don't want to add it to the project's Gemfile.

* * *

Blog post:

[**Loading Additional Ruby Gems in Development**<br>
*Using your favorite gems without adding them to your project's Gemfile*](https://phili.pe/posts/loading-additional-ruby-gems-in-development/)

## Installation

Run the following inside a folder that does **not** have a `Gemfile` in it:

    $ bundle plugin install bundler-private_install

## How It Works

After running `bundle install` it will trigger another `bundle install` for any other Gemfile that contains `eval_gemfile`.

The assumption is that this other Gemfile has an `eval_gemfile 'Gemfile'`, i.e. a dependency on the main Gemfile.

As to why you'd want to do this, see the blog post linked above.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
