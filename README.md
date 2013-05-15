Ruby CFT
========

Ruby CFT is a bridge to the official
[CFT](https://github.com/sstephenson/cft) compiler for embedded
CoffeeScript templates.

```ruby
require "cft"

CFT.compile(File.read("template.cft"))
# => "function(...) {...}"

context = CFT.context_for("Hello <%= @name %>")
context.call("render", :name => "Sam")
# => "Hello Sam"

CFT.render("Hello <%= @name %>", :name => "world")
# => "Hello world"
```

Installation
------------

    $ gem install cft


Dependencies
------------

This library depends on the `cft-source` gem which is updated any time
a new version of CFT is released. (The `cft-source` gem's version
number is synced with each official CFT release.) This way you can
build against different versions of CFT by requiring the correct
version of the `cft-source` gem.

In addition, you can use this library with unreleased versions of CFT
by setting the `CFT_SOURCE_PATH` environment variable:

    export CFT_SOURCE_PATH=/path/to/cft/dist/cft.js


### Ruby CoffeeScript

The [Ruby CoffeeScript](https://github.com/josh/ruby-coffee-script)
library is used to load the CoffeeScript compiler source. See the
[README](https://github.com/josh/ruby-coffee-script/blob/master/README.md)
for information on loading a specific version of the CoffeeScript
compiler.

### ExecJS

The [ExecJS](https://github.com/sstephenson/execjs) library is used to
automatically choose the best JavaScript engine for your
platform. Check out its
[README](https://github.com/sstephenson/execjs/blob/master/README.md)
for a complete list of supported engines.
