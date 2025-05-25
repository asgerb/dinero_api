require_relative "lib/dinero/version"

Gem::Specification.new do |spec|
  spec.name = "dinero_ruby"
  spec.version = Dinero::VERSION
  spec.authors = ["asgerb"]
  spec.email = ["a@asgerbehnckejacobsen.dk"]

  spec.summary = "Api wrapper for Dinero"
  spec.description = "Api wrapper for Dinero"
  spec.homepage = "https://github.com/asgerb/dinero_ruby"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/asgerb/dinero_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/asgerb/dinero_ruby/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.0"

  spec.add_development_dependency "dotenv"
end
