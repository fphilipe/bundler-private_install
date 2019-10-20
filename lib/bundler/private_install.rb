require "bundler/private_install/version"

module Bundler
  Plugin.add_hook('after-install-all') do |dependencies|
    next unless SharedHelpers.default_gemfile.basename.to_s == 'Gemfile'

    `grep --files-with-match --null eval_gemfile Gemfile.*`.split("\x0").each do |file|
      puts nil, "Installing #{file}"
      system(%{cp Gemfile.lock "#{file}.lock"})
      system(%{BUNDLE_GEMFILE="#{file}" bundle install})
    end
  end
end
