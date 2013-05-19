Gem::Specification.new do |s|
  s.name        = "cft"
  s.version     = "0.0.2"

  s.authors     = ["Alex MacCaw"]
  s.email       = "alex@alexmaccaw.com"
  s.homepage    = "https://github.com/maccman/ruby-cft"

  s.summary     = "Ruby CFT Compiler (Embedded CoffeeScript templates)"
  s.description = <<-EOS
    Ruby CFT is a bridge to the official JavaScript CFT compiler.
  EOS

  s.files = [
    "lib/cft.rb",
    "LICENSE",
    "README.md"
  ]

  s.add_dependency "coffee-script"
  s.add_dependency "cft-source"
  s.add_dependency "execjs"
end
