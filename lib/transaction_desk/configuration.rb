module TransactionDesk

  class Configuration
    attr_accessor :api_url
    attr_accessor :path_url

    def initialize
      @api_url  = 'https://api.pre.transactiondesk.com'
      @path_url = 'v2'
    end
  end

  class << self

    def configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def configure
      yield(configuration)
    end

  end
end
