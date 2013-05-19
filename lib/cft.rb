require "coffee_script"
require "cft/source"
require "execjs"

module CFT
  module Source
    def self.path
      @path ||= ENV["CFT_SOURCE_PATH"] || bundled_path
    end

    def self.path=(path)
      @contents = @version = @context = nil
      @path = path
    end

    def self.contents
      @contents ||= File.read(path)
    end

    def self.combined_contents
      [CoffeeScript::Source.contents, contents].join(";\n")
    end

    def self.version
      @version ||= contents[/CFT Compiler v(.*?)\s/, 1]
    end

    def self.context
      @context ||= ExecJS.compile(combined_contents)
    end
  end

  autoload :Template, 'cft/template'

  class << self
    def version
      Source.version
    end

    def compile(template)
      template = template.read if template.respond_to?(:read)
      Source.context.call("cft.precompile", template)
    end

    def context_for(template)
      ExecJS.compile("var render = #{compile(template)}")
    end

    def render(template, locals = {})
      context_for(template).call("render", locals)
    end
  end
end