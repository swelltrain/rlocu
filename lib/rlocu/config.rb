require 'yaml'
module Rlocu
  
  class << self

    def config!(file=File.expand_path("../../../.config", __FILE__))
      configs = YAML::load(File.open(file))
      @api_key = configs['API_KEY']  
      @http_base = configs['HTTP_BASE']  
    end

    def api_key
      @api_key
    end

    def http_base
      @http_base
    end

  end

end
