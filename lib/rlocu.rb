#require "rlocu/version"
require 'yaml'

module Rlocu
  def self.config!(file=File.expand_path("../../.config", __FILE__))
    configs = YAML::load(File.open(file))
    @api_key = configs['API_KEY']    
  end
  def self.api_key
    @api_key
  end
end
