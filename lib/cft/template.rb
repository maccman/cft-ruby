require 'tilt'

module CFT
  # Tilt engine class for the CFT compiler. Depends on the `cft` gem.
  #
  # For more infomation see:
  #
  #   https://github.com/sstephenson/ruby-eco
  #   https://github.com/sstephenson/eco
  #
  class CFTTemplate < Tilt::Template
    # Check to see if CFT is loaded
    def self.engine_initialized?
      defined? ::CFT
    end

    # Autoload eco library. If the library isn't loaded, Tilt will produce
    # a thread safetly warning. If you intend to use `.eco` files, you
    # should explicitly require it.
    def initialize_engine
      require_template_library 'cft'
    end

    def prepare
    end

    # Compile template data with CFT compiler.
    #
    # Returns a JS function definition String. The result should be
    # assigned to a JS variable.
    #
    #     # => "function(...) {...}"
    #
    def evaluate(scope, locals, &block)
      CFT.compile(data)
    end
  end
end