#!/home/jake/.rbenv/versions/2.2.3/bin/ruby
#
# This file was generated by RubyGems.
#
# The application 'classifier-reborn' is installed as part of a gem, and
# this file is here to facilitate running it.
#

require 'rubygems'

version = ">= 0"

if ARGV.first
  str = ARGV.first
  str = str.dup.force_encoding("BINARY") if str.respond_to? :force_encoding
  if str =~ /\A_(.*)_\z/ and Gem::Version.correct?($1) then
    version = $1
    ARGV.shift
  end
end

gem 'classifier-reborn', version
load Gem.bin_path('classifier-reborn', 'summarize.rb', version)
