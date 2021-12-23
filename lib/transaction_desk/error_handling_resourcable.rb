module ErrorHandlingResourcable
  def self.included(base)
    base.send(:resources) do
      default_handler do |response|
        if (200...299).include?(response.status)
          next
        elsif response.status == 401
          raise TransactionDesk::UnauthorizedError.new("#{response.status}: #{response.body}")
        else
          raise TransactionDesk::Error.new("#{response.status}: #{response.body}")
        end
      end
    end
  end
end
