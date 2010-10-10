require 'rake/testtask'

Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
  test.libs << 'test'
end


begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "gmaps4rails"
    gem.summary = "Enable easy display of items (taken from a model) on a Google Map. Uses Javascript API V3."
    gem.description = "Enable easy display of items (taken from a model) on a Google Map. Uses Javascript API V3."
    gem.homepage = "http://github.com/apneadiving/test-for-maps"
    gem.email = "apnea.diving.deep@gmail.com"
    gem.authors = ["Benjamin Roth"]
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{public}/**/*", "{config}/**/*"]
  end
  Jeweler::GemcutterTasks.new
rescue
  puts "Jeweler or dependency not available."
end
