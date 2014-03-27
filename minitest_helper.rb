require 'minitest/autorun'
require_relative 'lib/rlocu'
# run some code before every test so we don't 
# have to specify setup in each test file
MiniTest::Unit::TestCase.add_setup_hook { Rlocu.config! File.expand_path("./.config") }

Dir.glob('./test/test_*.rb').each { |file| require file}

