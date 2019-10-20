lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bundler/private_install/version"

Gem::Specification.new do |s|
  s.name          = "bundler-private_install"
  s.version       = Bundler::PrivateInstall::VERSION
  s.authors       = ["Philipe Fatio"]
  s.email         = ["me@phili.pe"]
  s.summary       = %q{A Bundler plugin that installs gems in an additional private Gemfile after bundle install.}
  s.description   = s.summary
  s.homepage      = "https://github.com/fphilipe/bundler-private_install"
  s.license       = "MIT"

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = s.homepage
  s.metadata["changelog_uri"] = s.homepage + "/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|s|features)/}) }
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
