module TransactionDesk
  class ErrorMapping

    Error = Struct.new(:code, :message, :details, :data)

    include Kartograph::DSL

    kartograph do
      mapping Error

      scoped :read do
        property :code
        property :message
        property :details
        property :data
      end

    end

    def self.fail_with(klass, content)
      error = extract_single(content, :read)
      raise klass, "Code: #{error.code}, Source: #{error.source}"
    end

  end
end
