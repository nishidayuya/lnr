# frozen_string_literal: true

require_relative "lib/lnr/version"

Gem::Specification.new do |spec|
  spec.name = "lnr"
  spec.version = Lnr::VERSION
  spec.authors = ["Yuya.Nishida."]
  spec.email = ["yuya@j96.org"]

  spec.licenses = %w[X11]
  spec.summary = "make hard links recursive"
  spec.homepage = "https://github.com/nishidayuya/lnr"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
