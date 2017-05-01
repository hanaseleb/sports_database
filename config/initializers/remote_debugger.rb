if ENV['RUBY_DEBUG_PORT']
  require 'ruby-debug-ide'
  Debugger.start_server nil, ENV['RUBY_DEBUG_PORT'].to_i
end