guard 'rails' do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
end

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' }, :wait => 45 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

guard 'rspec', :version => 2, :cli => "--color --drb --tag ~no_drb --fail-fast -f #{ENV['RSPEC_FORMAT'] || 'progress'}",
 :bundler => false, :all_after_pass => false, :all_on_start => false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{app/(.*)\.rb})                            { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{app/(.*\.haml)})                          { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('spec/factories.rb')                         { "spec/models" }
end

guard 'pow' do
  watch('.powrc')
  watch('.powenv')
  watch('.rvmrc')
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
end
