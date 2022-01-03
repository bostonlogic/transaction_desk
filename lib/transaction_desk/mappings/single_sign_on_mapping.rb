module TransactionDesk
  class SingleSignOnMapping
    include Kartograph::DSL

    kartograph do
      mapping SingleSignOn

      scoped :read do
        property :link
      end

    end
  end
end
