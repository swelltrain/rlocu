require 'yaml'

configs = YAML::load(File.open(File.expand_path('../../.config', __FILE__)))

Rlocu.configure { |rlocu| rlocu.api_key = configs['API_KEY'] }
