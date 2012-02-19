require "bundler/gem_tasks"

def name
    @name ||= Dir['*.gemspec'].first.split('.').first
end

def version
    line = File.read("lib/#{name}/version.rb")[/^\s*VERSION\s*=\s*.*/]
      line.match(/.*VERSION\s*=\s*['"](.*)['"]/)[1]
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
