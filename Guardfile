# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{views/.+\.(erb|haml|slim)$})
  watch(%r{helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
end

guard 'compass' do
  watch(%r{^_sass/(.*)\.s[ac]ss})
end
