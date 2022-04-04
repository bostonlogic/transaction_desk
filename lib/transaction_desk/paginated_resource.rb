module TransactionDesk
  class PaginatedResource
    include Enumerable

    BATCH_SIZE = 100

    attr_reader :action, :resource, :collection
    attr_accessor :total

    def initialize(action, resource, *args)
      @batch_number = 0
      @total = nil
      @action = action
      @resource = resource
      @collection = []
      @args = args
      @options = args.last.kind_of?(Hash) ? args.last : {}
    end

    def batch_size
      @options['$take'] || BATCH_SIZE
    end

    def [](index)
      @collection[index]
    end

    def each(start = 0, &block)
      # Start off with the first page if we have no idea of anything yet
      fetch_next_page if total.nil?

      return to_enum(:each, start) unless block_given?
      Array(@collection[start..-1]).each do |element|
        yield(element)
      end

      unless last?
        start = [@collection.size, start].max
        fetch_next_page
        each(start, &block)
      end

      self
    end

    def last?
      @total < batch_size
    end

    def ==(other)
      each_with_index.each.all? {|object, index| object == other[index] }
    end

    private

    def fetch_next_page
      retrieve(@batch_number)
      @batch_number += batch_size
    end

    def retrieve(batch_number, batch_size = self.batch_size)
      invoker = ResourceKit::ActionInvoker.new(action, resource, *@args)
      invoker.options['$take'] ||= batch_size
      invoker.options['$skip'] = batch_number

      batch = invoker.handle_response
      @total = batch.size
      
      @collection += batch
    end

  end
end
