require_relative '../../util/clean_software.rb'
require_relative '../../util/read_version'

name "manifold"
maintainer "Zach Davis, Cast Iron Coding"
homepage "https://github.com/manifoldScholar/manifold"

license "GPL-3.0"

replace   "manifold"
conflict  "manifold"

# Defaults to C:/manifold on Windows
# and /opt/manifold on all other platforms
install_dir "#{default_root}/#{name}"

build_version do
  source :git, from_dependency: 'manifold'
end

build_iteration ReadVersion.build_iteration

# Creates required build directories
dependency "preparation"
# Healthcheck will fail without it because nginx software definition does not
# explicitly require it.
dependency "zlib"

# Manifold dependencies/components
dependency "nodejs-binary"
dependency "pandoc-binary"
dependency "chef-gem"
dependency "chef-zero"
dependency "openssl"
dependency "nginx"
dependency "runit"
dependency "redis"
dependency "postgresql"
dependency "imagemagick"
dependency "ruby"
dependency "bundler"
dependency "libxml2"
dependency "icu"
dependency "yarn"
dependency "logrotate"
dependency "elasticsearch"

# Manifold itself
dependency "manifold"
dependency "manifold-psql"
dependency "manifold-scripts"
dependency "manifold-ctl"
dependency "manifold-config-template"
dependency "manifold-cookbooks"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"

override :nodejs, version: "8.16.0"
override :ruby, version: "2.4.4"
override :libtool, version: "2.4.2"
override :rubygems, version: "2.7.8"
override :bundler, version: "1.17.2"
override "omnibus-ctl", version: "v0.5.0"
override "rb-readline", version: "v0.5.5"
