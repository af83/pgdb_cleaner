#!/usr/local/bin/ruby
build_databases=`psql -wltA | cut -f1 -d'|' | grep "build_"`.split

oldest_build = "build_#{(Time.now - ENV['AGE'].to_i).strftime("%Y%m%d%H%S")}"
old_build_databases = build_databases.select { |name| name < oldest_build }

old_build_databases.each do |name|
  puts "Drop old database #{name}"
  `dropdb -w #{name}` unless ENV.has_key?('DRYRUN')
end
